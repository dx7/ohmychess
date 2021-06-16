class Theme < OpenStruct

  attr_accessor :name, :created_by, :colors

  def initialize(name = :default)
    @theme ||= begin
      filename = "config/themes/#{name}.yml"
      hash = YAML.load(App.read_file(filename))
      struct = OpenStruct.load_recursive(hash)

      @name = struct.name
      @created_by = struct.created_by
      @colors = struct.colors
    rescue => e
      # TODO log
      puts "Theme `#{name}` expected in `#{filename}` not found. Loading theme default."
      name = :default
      retry
    end
  end

  def self.colors
    OpenStruct.new({
      reset: "\e[0m"
    })
  end

end
