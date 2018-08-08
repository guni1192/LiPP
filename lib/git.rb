# frozen_string_literal: true

require 'fileutils'
require 'open3'

module Git
  def pull
    Open3.popen3("cd #{clone_path} && git pull")
  end

  def delete_repo
    FileUtils.rm_r(clone_path)
  end

  def clone_or_pull
    if Dir.exist?(clone_path)
      pull
    else
      clone
    end
  end

  def clone
    clone_root_init
    Open3.popen3("git clone #{clone_url} #{clone_path}")
  end

  def clone_url
    init_client
    "https://#{deployer.name}:#{deployer.oauth_token}@github.com/#{repository[:full_name]}"
  end

  def clone_root_init
    FileUtils.mkdir_p(clone_root) unless Dir.exist?(clone_root)
  end

  def clone_root
    Rails.root.join('tmp', 'clones')
  end

  def clone_path
    "#{clone_root}/#{repository[:full_name]}"
  end

  def set_webhook
    init_client
    begin
      @client.create_hook(
        repository[:full_name],
        'web',
        {
          url: "#{ENV['LIPP_HOST']}/hooks",
          content_type: 'json'
        },
        events: ['push'],
        active: true
      )
    rescue Octokit::UnprocessableEntity
      logger.info 'This url is already registed!!'
      logger.info ENV['LIPP_HOST']
    end
  end
end
