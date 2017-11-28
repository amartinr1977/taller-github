# Curso de Git Pages

## Crear un repositorio en github

Una vez creado el repositorio, deberemos activar en `Settings` del repositorio, en el apartado `GitHub Pages`, seleccionar la fuente/source *(por defecto escogeremos **master branch** como fuente para el sitio Web a servir del *GitHub Pages*)*, y elegir un theme/tema para nuestro sitio Web *(Change Theme)*.

Una vez hecho lo anterior, para acceder a la Web usaremos el siguiente formato:

https://amartinr1977.github.io/***nombre_del_repositorio_github***/

## Referencia de Markdown

https://help.github.com/articles/basic-writing-and-formatting-syntax/

## Instalación de Ruby (> 2.0)

apt-get install ruby ruby-all-dev
ruby --version

## Jekyll

Instalamos el gestor de dependencias de ruby bundler:

sudo gem install bundler

Para poder probar las pages web sin necesidad de subir el código markdown del git a github.


Crear un Gemfile:
```
source 'https://rubygems.org'

gem 'github-pages', group: :jekyll_plugins
```

Para leer el Gemfile y instalar las dependencias ejecutar, para ya poder probar las Webs localmente:

```
bundle install 
```

## Páginas a visualizar

Por defecto, la página `index` del sitio Web es el `README.md`.  Si queremos acceder a otra página del proyecto, por ejemplo, `referencias.md`, tan sólo habrá que añadir el nombre de ese archivo al final de la URL:

