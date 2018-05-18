# frozen_string_literal: true

module Container
  def init_container
    @container = Docker::Container.create(
      name: 'nginx-test',
      Image: 'nginx',
      Tty: true,
      ExposedPorts: { "80/tcp": {} },
      PortBindings: {
        "80/tcp": [{ HostPort: '8000' }]
      }
    )
  rescue Docker::Error::ConflictError
    @container = Docker::Container.get('nginx-test')
  rescue Docker::Error::NotFoundError
    Docker::Image.create(fromImage: 'nginx:latest')
  end

  def up_container
    init_container
    @container.start
  end

  def container
    @container
  end
end
