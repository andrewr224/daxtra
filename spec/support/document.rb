# frozen_string_literal: true

require "singleton"
require "rack/test"

class Document
  RESUME_FORMAT =
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"

  RESUME         = "resume.docx"
  EMPTY_RESUME   = "empty_resume.docx"
  INVALID_RESUME = "invalid_resume.docx"

  include Singleton

  attr_reader :file

  def resume
    @resume ||= Rack::Test::UploadedFile.new(
      path_for(RESUME),
      content_type
    )
  end

  def empty_resume
    @empty_resume ||= Rack::Test::UploadedFile.new(
      path_for(EMPTY_RESUME),
      content_type
    )
  end

  def invalid_resume
    @invalid_resume ||= Rack::Test::UploadedFile.new(
      path_for(INVALID_RESUME),
      content_type
    )
  end

  def content_type
    RESUME_FORMAT
  end

  private

  def path_for(filename)
    "#{gem_root_path}/spec/support/files/#{filename}"
  end

  def gem_root_path
    return Bundler.root if defined?(Bundler)

    Dir.pwd
  end
end
