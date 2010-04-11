require 'rake/gempackagetask'
require 'spec/rake/spectask'

VERSION = File.read('VERSION')

# =========
# = specs =
# =========
task :default => :spec

Spec::Rake::SpecTask.new do |t|
  t.libs << 'lib'
  t.warning = true
  t.rcov = false
  t.spec_opts = ["--colour"]
end

# ================
# = building gem =
# ================
spec = Gem::Specification.new do |s|
  s.name = "FFI-libsndfile"
  s.version = VERSION

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

# ========
# = rdoc =
# ========
require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ffi-libsndfile #{VERSION}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end