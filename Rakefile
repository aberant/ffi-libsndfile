require 'rake/gempackagetask'
require 'spec/rake/spectask'

task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.libs << 'lib'
  t.warning = true
  t.rcov = false
  t.spec_opts = ["--colour"]
end

spec = Gem::Specification.new do |s|
  s.name = "FFI-libsndfile"
  s.version = "0.0.1"

  s.author = "Colin Harris"
  s.email = "qzzzq1@gmail.com"
  s.homepage = "http://aberant.tumblr.com/"
  s.platform = Gem::Platform::RUBY
  s.summary = "low level FFI wrapper for libsndfile"

  s.files = FileList["lib/**/*"].to_a
  s.require_path = "lib"
  s.test_files = FileList["{spec}/**/*_spec.rb"].to_a

  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]

  s.rubygems_version = %q{1.3.6}
  s.add_dependency("rspec", ">= 1.3.0")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end