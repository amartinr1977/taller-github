# Curso de Git Pages

## Instalación de Ruby (> 2.0)

apt-get install ruby
ruby --version

## Jekyll

Instalamos el gestor de dependencias de ruby bundler:

sudo gem install bundler

Para poder probar las pages web sin necesidad de subir el código markdown del git a github.


Crear un Gemfile:
'''
source 'https://rubygems.org'

gem 'github-pages', group: :jekyll_plugins
'''

Para leer el Gemfile y instalar las dependencias ejecutar:

bundle install 