# frozen_string_literal: true

module Container
  def load_conf
    @config =
      File.open("#{clone_path}/hujiwara.yml", 'r') do |f|
        YAML.safe_load(f).with_indifferent_access
      end
  end

  def init_container
    create_container
  rescue Docker::Error::NotFoundError
    Docker::Image.create!(fromImage: @config[:image])
    create_container
  end

  def create_container
    load_conf
    begin
      @container = Docker::Container.create(
        name: container_name,
        Image: @config[:image],
        Tty: true,
        ExposedPorts: { "80/tcp": {} },
        PortBindings: {
          "80/tcp": [{ HostPort: '8000' }]
        }
      )
    rescue Docker::Error::ConflictError
      container = Docker::Container.get(container_name)
      container.delete(force: true)
      create_container
    end
  end

  def up_container
    init_container
    @container.start
  end

  def container_name
    "#{deployer.name}-#{repository[:name]}"
  end
end
