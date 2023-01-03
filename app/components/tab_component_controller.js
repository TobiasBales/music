import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    bpm: Number,
    countIn: Boolean,
    metronome: Boolean,
    tab: String,
    type: String,
    file: String,
  };

  static targets = ["viewport", "wrap", "main", "overlay", "trackTemplate", "trackList", "songArtist", "songTitle", "countIn", "metronome", "loop", "print", "zoom", "layout", "playerProgress", "playPause", "stop", "playPauseIcon", "songPosition", "tab", "muteIcon"];

  connect() {
    this.previousTime = -1;
    this.bpm = this.bpmValue;
    this.muted = false;

    this.api = new alphaTab.AlphaTabApi(this.mainTarget, this.settings);

    this.api.playerPositionChanged.on(this.playerPositionChanged);
    this.api.playerReady.on(this.playerReady);
    this.api.playerStateChanged.on(this.playerStateChanged)
    this.api.renderFinished.on(this.renderFinished);
    this.api.renderStarted.on(this.renderStarted);
    this.api.scoreLoaded.on(this.scoreLoaded);
    this.api.soundFontLoad.on(this.soundFontLoad);

    this.layoutTarget.onchange = this.handleLayoutChanged;
    this.zoomTarget.onchange = this.handleZoomChanged;

    if (this.metronomeValue) {
      this.toggleMetronome();
    }

    if (this.countInValue) {
      this.toggleCountIn();
    }

    if (this.isTex()) {
      this.updateTabBpm();
    }
    document.addEventListener('keypress', this.handleKeypress)
  }

  disconnect() {
    document.removeEventListener('keypress', this.handleKeypress)
  }

  scoreLoaded = (score) => {
    this.updateTrackList(score);
    this.updateTitle(score);
  }

  renderStarted = () => {
    this.showOverlay();
    this.renderTracks();
  }

  renderFinished = () => {
    this.hideOverlay();
  }

  playerReady = () => {
    this.playerProgressTarget.style.display = "none";
    this.playPauseTarget.classList.remove("disabled");
    this.stopTarget.classList.remove("disabled");
  }

  playerStateChanged = (e) => {
    if (e.state === alphaTab.synth.PlayerState.Playing) {
      this.playPauseIconTarget.classList.remove("fa-play");
      this.playPauseIconTarget.classList.add("fa-pause");
    } else {
      this.playPauseIconTarget.classList.remove("fa-pause");
      this.playPauseIconTarget.classList.add("fa-play");
    }
  }

  soundFontLoad = (e) => {
    const percentage = Math.floor((e.loaded / e.total) * 100);
    this.playerProgressTarget.innerText = percentage + "%";
  }

  playerPositionChanged = (e) => {
    const currentSeconds = (e.currentTime / 1000) | 0;
    if (currentSeconds == this.previousTime) {
      return;
    }

    this.previousTime = currentSeconds;

    this.songPositionTarget.innerText =
      this.formatDuration(e.currentTime) + " / " + this.formatDuration(e.endTime);
  }

  handleZoomChanged = () => {
    const zoomLevel = parseInt(this.zoomTarget.value) / 100;
    this.api.settings.display.scale = zoomLevel;
    this.api.updateSettings();
    this.api.render();
  }

  handleLayoutChanged = () => {
    switch (this.layoutTarget.value) {
      case "horizontal":
        this.api.settings.display.layoutMode = alphaTab.LayoutMode.Horizontal;
        break;
      case "page":
        this.api.settings.display.layoutMode = alphaTab.LayoutMode.Page;
        break;
    }
    this.api.updateSettings();
    this.api.render();
  }

  handleKeypress = (e) => {
    if (e.code == "Space") {
      this.playPause();
    }
  }

  updateTabBpm() {
    this.api.tex(this.tabTarget.innerHTML.replace("BPM", this.bpmValue));
  }

  increaseBpm() {
    if (this.isFile()) {
      return;
    }

    this.bpmValue += 5;
    this.updateTabBpm();
  }

  decreaseBpm() {
    if (this.isFile()) {
      return;
    }

    this.bpmValue -= 5;
    this.updateTabBpm();
  }

  updateTitle(score) {
    this.songTitleTarget.innerText = score.title;
    this.songArtistTarget.innerText = score.artist;
  }

  renderTracks() {
    const tracks = new Map();
    this.api.tracks.forEach((t) => {
      tracks.set(t.index, t);
    });
    const trackItems = this.trackListTarget.querySelectorAll(".at-track");
    trackItems.forEach((trackItem) => {
      if (tracks.has(trackItem.track.index)) {
        trackItem.classList.add("active");
      } else {
        trackItem.classList.remove("active");
      }
    });
  }

  updateTrackList(score) {
    if (score.tracks.length == 1) {
      this.trackListTarget.style.display = "none";
      return;
    }

    this.trackListTarget.innerHTML = "";
    score.tracks.forEach((track) => {
      this.trackListTarget.appendChild(this.createTrackItem(track));
    });
  }

  showOverlay() {
    this.overlayTarget.style.display = "flex";
  }

  hideOverlay() {
    this.overlayTarget.style.display = "none";
  }

  playPause() {
    if (this.playPauseTarget.classList.contains("disabled")) {
      return;
    }
    this.api.playPause();
  };

  stop() {
    if (this.stopTarget.classList.contains("disabled")) {
      return;
    }
    this.api.stop();
  };

  toggleCountIn() {
    this.countInTarget.classList.toggle('active');
    if (this.countInTarget.classList.contains('active')) {
      this.api.countInVolume = 1;
    } else {
      this.api.countInVolume = 0;
    }
  }

  toggleMetronome() {
    this.metronomeTarget.classList.toggle("active");
    if (this.metronomeTarget.classList.contains("active")) {
      this.api.metronomeVolume = 1;
    } else {
      this.api.metronomeVolume = 0;
    }
  }

  toggleLoop() {
    this.loopTarget.classList.toggle("active");
    this.api.isLooping = this.loopTarget.classList.contains("active");
  }

  toggleMute() {
    this.mute = !this.mute;
    console.log(this.mute);
    this.api.changeTrackMute(this.api.tracks, this.mute);
    if (this.mute) {
      this.muteIconTarget.classList.remove("bi-volume-down");
      this.muteIconTarget.classList.add("bi-volume-mute");
    } else {
      this.muteIconTarget.classList.remove("bi-volume-mute");
      this.muteIconTarget.classList.add("bi-volume-down");
    }
  }

  print() {
    this.api.print();
  }

  formatDuration(milliseconds) {
    let seconds = milliseconds / 1000;
    const minutes = (seconds / 60) | 0;
    seconds = (seconds - minutes * 60) | 0;
    return (
      String(minutes).padStart(2, "0") +
      ":" +
      String(seconds).padStart(2, "0")
    );
  }

  createTrackItem(track) {
    const trackItem = this.trackTemplateTarget
      .content.cloneNode(true).firstElementChild;
    trackItem.querySelector(".at-track-name").innerText = track.name;
    trackItem.track = track;
    trackItem.onclick = (e) => {
      e.stopPropagation();
      this.api.renderTracks([track]);
    };
    return trackItem;
  }

  isTex() {
    return this.typeValue == "tex"
  }

  isFile() {
    return this.typeValue == "file"
  }

  get settings() {
    const file = this.isFile() ? { file: this.fileValue } : {};
    return {
      ...file,
      display: {
        staveProfile: "Tab",
      },
      notation: {
        rhythmMode: "ShowWithBars",
      },
      player: {
        enablePlayer: true,
        soundFont: "https://cdn.jsdelivr.net/npm/@coderline/alphatab@latest/dist/soundfont/sonivox.sf2",
        scrollElement: this.viewportTarget,
      },
    }
  }
}
