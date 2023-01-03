# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `globalid` gem.
# Please instead update this file by running `bin/tapioca gem globalid`.

# source://globalid//lib/global_id/global_id.rb#8
class GlobalID
  extend ::ActiveSupport::Autoload

  # @return [GlobalID] a new instance of GlobalID
  #
  # source://globalid//lib/global_id/global_id.rb#51
  def initialize(gid, options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/global_id.rb#63
  def ==(other); end

  # source://globalid//lib/global_id/global_id.rb#49
  def app(*_arg0, **_arg1, &_arg2); end

  # source://globalid//lib/global_id/global_id.rb#63
  def eql?(other); end

  # source://globalid//lib/global_id/global_id.rb#55
  def find(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/global_id.rb#68
  def hash; end

  # source://globalid//lib/global_id/global_id.rb#59
  def model_class; end

  # source://globalid//lib/global_id/global_id.rb#49
  def model_id(*_arg0, **_arg1, &_arg2); end

  # source://globalid//lib/global_id/global_id.rb#49
  def model_name(*_arg0, **_arg1, &_arg2); end

  # source://globalid//lib/global_id/global_id.rb#49
  def params(*_arg0, **_arg1, &_arg2); end

  # source://globalid//lib/global_id/global_id.rb#72
  def to_param; end

  # source://globalid//lib/global_id/global_id.rb#49
  def to_s(*_arg0, **_arg1, &_arg2); end

  # Returns the value of attribute uri.
  #
  # source://globalid//lib/global_id/global_id.rb#48
  def uri; end

  class << self
    # Returns the value of attribute app.
    #
    # source://globalid//lib/global_id/global_id.rb#10
    def app; end

    # source://globalid//lib/global_id/global_id.rb#32
    def app=(app); end

    # source://globalid//lib/global_id/global_id.rb#12
    def create(model, options = T.unsafe(nil)); end

    # source://globalid//lib/global_id.rb#15
    def eager_load!; end

    # source://globalid//lib/global_id/global_id.rb#22
    def find(gid, options = T.unsafe(nil)); end

    # source://globalid//lib/global_id/global_id.rb#26
    def parse(gid, options = T.unsafe(nil)); end

    private

    # source://globalid//lib/global_id/global_id.rb#37
    def parse_encoded_gid(gid, options); end

    # We removed the base64 padding character = during #to_param, now we're adding it back so decoding will work
    #
    # source://globalid//lib/global_id/global_id.rb#42
    def repad_gid(gid); end
  end
end

# source://globalid//lib/global_id/identification.rb#2
module GlobalID::Identification
  # source://globalid//lib/global_id/identification.rb#3
  def to_gid(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/identification.rb#8
  def to_gid_param(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/identification.rb#3
  def to_global_id(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/identification.rb#12
  def to_sgid(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/identification.rb#17
  def to_sgid_param(options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/identification.rb#12
  def to_signed_global_id(options = T.unsafe(nil)); end
end

# source://globalid//lib/global_id/locator.rb#5
module GlobalID::Locator
  class << self
    # Takes either a GlobalID or a string that can be turned into a GlobalID
    #
    # Options:
    # * <tt>:only</tt> - A class, module or Array of classes and/or modules that are
    #   allowed to be located.  Passing one or more classes limits instances of returned
    #   classes to those classes or their subclasses.  Passing one or more modules in limits
    #   instances of returned classes to those including that module.  If no classes or
    #   modules match, +nil+ is returned.
    #
    # source://globalid//lib/global_id/locator.rb#15
    def locate(gid, options = T.unsafe(nil)); end

    # Takes an array of GlobalIDs or strings that can be turned into a GlobalIDs.
    # All GlobalIDs must belong to the same app, as they will be located using
    # the same locator using its locate_many method.
    #
    # By default the GlobalIDs will be located using Model.find(array_of_ids), so the
    # models must respond to that finder signature.
    #
    # This approach will efficiently call only one #find (or #where(id: id), when using ignore_missing)
    # per model class, but still interpolate the results to match the order in which the gids were passed.
    #
    # Options:
    # * <tt>:only</tt> - A class, module or Array of classes and/or modules that are
    #   allowed to be located.  Passing one or more classes limits instances of returned
    #   classes to those classes or their subclasses.  Passing one or more modules in limits
    #   instances of returned classes to those including that module.  If no classes or
    #   modules match, +nil+ is returned.
    # * <tt>:ignore_missing</tt> - By default, locate_many will call #find on the model to locate the
    #   ids extracted from the GIDs. In Active Record (and other data stores following the same pattern),
    #   #find will raise an exception if a named ID can't be found. When you set this option to true,
    #   we will use #where(id: ids) instead, which does not raise on missing records.
    #
    # source://globalid//lib/global_id/locator.rb#41
    def locate_many(gids, options = T.unsafe(nil)); end

    # Takes an array of SignedGlobalIDs or strings that can be turned into a SignedGlobalIDs.
    # The SignedGlobalIDs are located using Model.find(array_of_ids), so the models must respond to
    # that finder signature.
    #
    # This approach will efficiently call only one #find per model class, but still interpolate
    # the results to match the order in which the gids were passed.
    #
    # Options:
    # * <tt>:only</tt> - A class, module or Array of classes and/or modules that are
    #   allowed to be located.  Passing one or more classes limits instances of returned
    #   classes to those classes or their subclasses.  Passing one or more modules in limits
    #   instances of returned classes to those including that module.  If no classes or
    #   modules match, +nil+ is returned.
    #
    # source://globalid//lib/global_id/locator.rb#75
    def locate_many_signed(sgids, options = T.unsafe(nil)); end

    # Takes either a SignedGlobalID or a string that can be turned into a SignedGlobalID
    #
    # Options:
    # * <tt>:only</tt> - A class, module or Array of classes and/or modules that are
    #   allowed to be located.  Passing one or more classes limits instances of returned
    #   classes to those classes or their subclasses.  Passing one or more modules in limits
    #   instances of returned classes to those including that module.  If no classes or
    #   modules match, +nil+ is returned.
    #
    # source://globalid//lib/global_id/locator.rb#58
    def locate_signed(sgid, options = T.unsafe(nil)); end

    # Tie a locator to an app.
    # Useful when different apps collaborate and reference each others' Global IDs.
    #
    # The locator can be either a block or a class.
    #
    # Using a block:
    #
    #   GlobalID::Locator.use :foo do |gid|
    #     FooRemote.const_get(gid.model_name).find(gid.model_id)
    #   end
    #
    # Using a class:
    #
    #   GlobalID::Locator.use :bar, BarLocator.new
    #
    #   class BarLocator
    #     def locate(gid)
    #       @search_client.search name: gid.model_name, id: gid.model_id
    #     end
    #   end
    #
    # @raise [ArgumentError]
    #
    # source://globalid//lib/global_id/locator.rb#99
    def use(app, locator = T.unsafe(nil), &locator_block); end

    private

    # @return [Boolean]
    #
    # source://globalid//lib/global_id/locator.rb#112
    def find_allowed?(model_class, only = T.unsafe(nil)); end

    # source://globalid//lib/global_id/locator.rb#108
    def locator_for(gid); end

    # source://globalid//lib/global_id/locator.rb#120
    def normalize_app(app); end

    # source://globalid//lib/global_id/locator.rb#116
    def parse_allowed(gids, only = T.unsafe(nil)); end
  end
end

# source://globalid//lib/global_id/locator.rb#128
class GlobalID::Locator::BaseLocator
  # source://globalid//lib/global_id/locator.rb#129
  def locate(gid); end

  # source://globalid//lib/global_id/locator.rb#133
  def locate_many(gids, options = T.unsafe(nil)); end

  private

  # source://globalid//lib/global_id/locator.rb#144
  def find_records(model_class, ids, options); end
end

# source://globalid//lib/global_id/locator.rb#173
class GlobalID::Locator::BlockLocator
  # @return [BlockLocator] a new instance of BlockLocator
  #
  # source://globalid//lib/global_id/locator.rb#174
  def initialize(block); end

  # source://globalid//lib/global_id/locator.rb#178
  def locate(gid); end

  # source://globalid//lib/global_id/locator.rb#182
  def locate_many(gids, options = T.unsafe(nil)); end
end

# source://globalid//lib/global_id/locator.rb#171
GlobalID::Locator::DEFAULT_LOCATOR = T.let(T.unsafe(nil), GlobalID::Locator::UnscopedLocator)

# source://globalid//lib/global_id/locator.rb#153
class GlobalID::Locator::UnscopedLocator < ::GlobalID::Locator::BaseLocator
  # source://globalid//lib/global_id/locator.rb#154
  def locate(gid); end

  private

  # source://globalid//lib/global_id/locator.rb#159
  def find_records(model_class, ids, options); end

  # source://globalid//lib/global_id/locator.rb#163
  def unscoped(model_class); end
end

# source://globalid//lib/global_id/railtie.rb#13
class GlobalID::Railtie < ::Rails::Railtie; end

# source://globalid//lib/global_id/verifier.rb#5
class GlobalID::Verifier < ::ActiveSupport::MessageVerifier
  private

  # source://globalid//lib/global_id/verifier.rb#11
  def decode(data); end

  # source://globalid//lib/global_id/verifier.rb#7
  def encode(data); end
end

# source://globalid//lib/global_id/signed_global_id.rb#5
class SignedGlobalID < ::GlobalID
  # @return [SignedGlobalID] a new instance of SignedGlobalID
  #
  # source://globalid//lib/global_id/signed_global_id.rb#51
  def initialize(gid, options = T.unsafe(nil)); end

  # source://globalid//lib/global_id/signed_global_id.rb#69
  def ==(other); end

  # Returns the value of attribute expires_at.
  #
  # source://globalid//lib/global_id/signed_global_id.rb#49
  def expires_at; end

  # Returns the value of attribute purpose.
  #
  # source://globalid//lib/global_id/signed_global_id.rb#49
  def purpose; end

  # source://globalid//lib/global_id/signed_global_id.rb#63
  def to_h; end

  # source://globalid//lib/global_id/signed_global_id.rb#58
  def to_param; end

  # source://globalid//lib/global_id/signed_global_id.rb#58
  def to_s; end

  # Returns the value of attribute verifier.
  #
  # source://globalid//lib/global_id/signed_global_id.rb#49
  def verifier; end

  private

  # source://globalid//lib/global_id/signed_global_id.rb#74
  def encoded_expiration; end

  # source://globalid//lib/global_id/signed_global_id.rb#78
  def pick_expiration(options); end

  class << self
    # Returns the value of attribute expires_in.
    #
    # source://globalid//lib/global_id/signed_global_id.rb#23
    def expires_in; end

    # Sets the attribute expires_in
    #
    # @param value the value to set the attribute expires_in to.
    #
    # source://globalid//lib/global_id/signed_global_id.rb#23
    def expires_in=(_arg0); end

    # source://globalid//lib/global_id/signed_global_id.rb#11
    def parse(sgid, options = T.unsafe(nil)); end

    # source://globalid//lib/global_id/signed_global_id.rb#27
    def pick_purpose(options); end

    # Grab the verifier from options and fall back to SignedGlobalID.verifier.
    # Raise ArgumentError if neither is available.
    #
    # source://globalid//lib/global_id/signed_global_id.rb#17
    def pick_verifier(options); end

    # Returns the value of attribute verifier.
    #
    # source://globalid//lib/global_id/signed_global_id.rb#9
    def verifier; end

    # Sets the attribute verifier
    #
    # @param value the value to set the attribute verifier to.
    #
    # source://globalid//lib/global_id/signed_global_id.rb#9
    def verifier=(_arg0); end

    private

    # source://globalid//lib/global_id/signed_global_id.rb#42
    def raise_if_expired(expires_at); end

    # source://globalid//lib/global_id/signed_global_id.rb#32
    def verify(sgid, options); end
  end
end

# source://globalid//lib/global_id/signed_global_id.rb#6
class SignedGlobalID::ExpiredMessage < ::StandardError; end

# source://globalid//lib/global_id/uri/gid.rb#7
class URI::GID < ::URI::Generic
  # URI::GID encodes an app unique reference to a specific model as an URI.
  # It has the components: app name, model class name, model id and params.
  # All components except params are required.
  #
  # The URI format looks like "gid://app/model_name/model_id".
  #
  # Simple metadata can be stored in params. Useful if your app has multiple databases,
  # for instance, and you need to find out which one to look up the model in.
  #
  # Params will be encoded as query parameters like so
  # "gid://app/model_name/model_id?key=value&another_key=another_value".
  #
  # Params won't be typecast, they're always strings.
  # For convenience params can be accessed using both strings and symbol keys.
  #
  # Multi value params aren't supported. Any params encoding multiple values under
  # the same key will return only the last value. For example, when decoding
  # params like "key=first_value&key=last_value" key will only be last_value.
  #
  # Read the documentation for +parse+, +create+ and +build+ for more.
  #
  # source://uri/0.12.0/uri/generic.rb#243
  def app; end

  # Returns the value of attribute model_id.
  #
  # source://globalid//lib/global_id/uri/gid.rb#29
  def model_id; end

  # Returns the value of attribute model_name.
  #
  # source://globalid//lib/global_id/uri/gid.rb#29
  def model_name; end

  # Returns the value of attribute params.
  #
  # source://globalid//lib/global_id/uri/gid.rb#29
  def params; end

  # source://globalid//lib/global_id/uri/gid.rb#96
  def to_s; end

  protected

  # Ruby 2.2 uses #query= instead of #set_query
  #
  # source://globalid//lib/global_id/uri/gid.rb#108
  def query=(query); end

  # source://globalid//lib/global_id/uri/gid.rb#119
  def set_params(params); end

  # source://globalid//lib/global_id/uri/gid.rb#102
  def set_path(path); end

  # Ruby 2.1 or less uses #set_query to assign the query
  #
  # source://globalid//lib/global_id/uri/gid.rb#114
  def set_query(query); end

  private

  # source://globalid//lib/global_id/uri/gid.rb#129
  def check_host(host); end

  # source://globalid//lib/global_id/uri/gid.rb#134
  def check_path(path); end

  # source://globalid//lib/global_id/uri/gid.rb#139
  def check_scheme(scheme); end

  # source://globalid//lib/global_id/uri/gid.rb#171
  def parse_query_params(query); end

  # source://globalid//lib/global_id/uri/gid.rb#147
  def set_model_components(path, validate = T.unsafe(nil)); end

  # @raise [URI::InvalidComponentError]
  #
  # source://globalid//lib/global_id/uri/gid.rb#157
  def validate_component(component); end

  # @raise [MissingModelIdError]
  #
  # source://globalid//lib/global_id/uri/gid.rb#164
  def validate_model_id(model_id, model_name); end

  class << self
    # Create a new URI::GID from components with argument check.
    #
    # The allowed components are app, model_name, model_id and params, which can be
    # either a hash or an array.
    #
    # Using a hash:
    #
    #   URI::GID.build(app: 'bcx', model_name: 'Person', model_id: '1', params: { key: 'value' })
    #
    # Using an array, the arguments must be in order [app, model_name, model_id, params]:
    #
    #   URI::GID.build(['bcx', 'Person', '1', key: 'value'])
    #
    # source://globalid//lib/global_id/uri/gid.rb#83
    def build(args); end

    # Shorthand to build a URI::GID from an app, a model and optional params.
    #
    #   URI::GID.create('bcx', Person.find(5), database: 'superhumans')
    #
    # source://globalid//lib/global_id/uri/gid.rb#67
    def create(app, model, params = T.unsafe(nil)); end

    # Create a new URI::GID by parsing a gid string with argument check.
    #
    #   URI::GID.parse 'gid://bcx/Person/1?key=value'
    #
    # This differs from URI() and URI.parse which do not check arguments.
    #
    #   URI('gid://bcx')             # => URI::GID instance
    #   URI.parse('gid://bcx')       # => URI::GID instance
    #   URI::GID.parse('gid://bcx/') # => raises URI::InvalidComponentError
    #
    # source://globalid//lib/global_id/uri/gid.rb#59
    def parse(uri); end

    # Validates +app+'s as URI hostnames containing only alphanumeric characters
    # and hyphens. An ArgumentError is raised if +app+ is invalid.
    #
    #   URI::GID.validate_app('bcx')     # => 'bcx'
    #   URI::GID.validate_app('foo-bar') # => 'foo-bar'
    #
    #   URI::GID.validate_app(nil)       # => ArgumentError
    #   URI::GID.validate_app('foo/bar') # => ArgumentError
    #
    # source://globalid//lib/global_id/uri/gid.rb#43
    def validate_app(app); end
  end
end

# source://globalid//lib/global_id/uri/gid.rb#124
URI::GID::COMPONENT = T.let(T.unsafe(nil), Array)

# Raised when creating a Global ID for a model without an id
#
# source://globalid//lib/global_id/uri/gid.rb#32
class URI::GID::MissingModelIdError < ::URI::InvalidComponentError; end

# Extracts model_name and model_id from the URI path.
#
# source://globalid//lib/global_id/uri/gid.rb#127
URI::GID::PATH_REGEXP = T.let(T.unsafe(nil), Regexp)
