# Curso de Git Pages

La info del taller esta en: [Web del Taller Web Pages](htpps://github.com/francho/taller-github-pages)

```
htpps://github.com/francho/taller-github-pages
```

## Crear un repositorio en github

Una vez creado el repositorio, deberemos activar en `Settings` del repositorio, en el apartado `GitHub Pages`, seleccionar la fuente/source *(por defecto escogeremos **master branch** como fuente para el sitio Web a servir del **GitHub Pages**)*, y elegir un theme/tema para nuestro sitio Web *(Change Theme)*.

Una vez hecho lo anterior, para acceder a la Web usaremos el siguiente formato:

```
https://amartinr1977.github.io/***nombre_del_repositorio_github***/
```

## Referencia de Markdown

[Sintaxis de Markdown](https://help.github.com/articles/basic-writing-and-formatting-syntax/)

```
https://help.github.com/articles/basic-writing-and-formatting-syntax/
```

## Instalación de Ruby (> 2.0)

```
apt-get install ruby ruby-all-dev
ruby --version
```

## Jekyll

Instalamos el gestor de dependencias de ruby bundler:

```
sudo gem install bundler
```

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

Una vez todo lo anterior, para tener un servidor local:

```
jekyll server
```

Al ejecutar el comando anterior, `jekyll server`, genera el directorio `_site` con todo el sitio Web a servir.

Para acceder ahora al sitio localmente *(al index, que es el README.md)*:

```
http://127.0.0.1:4000
```

Para acceder a *referencias.md*:

```
http://127.0.0.1:4000/referencias
```

Cuando haya cambios en la configuración de `jekyll`, será necesario parar y volver a arrancar el servicio.  Toda la configuración de `jekyll` esta en el archivo `_config.yml`.

## Páginas a visualizar

Por defecto, la página `index` del sitio Web es el `README.md`.  Si queremos acceder a otra página del proyecto, por ejemplo, `referencias.md`, tan sólo habrá que añadir el nombre de ese archivo al final de la URL:

## Convertir página Web en un Blog

Se crea una carpeta llamada `_post` dentro del repositorio, y dentro se añaden fichero markdown `*.md` con el formato `fecha_entre_guiones-nombre.md` *(touch _posts/2017-11-28-primer_post.md)*, y dentro los campos siguientes:


```
title: Titulo ...
--

Esto es mi primer artículo ...
```

## Personalización

Los directorios que empiezan por guión bajo tienen un tratamiento especial por `jekyll`: `_layouts` *(configura los estilos)*, `_posts` *(entradas del sitio Web)*, `_site` *(el sitio web que sirve, al que da servicio)*, etc.

## Comprobación y depuración

[Web de Depueración](https://travis-ci.org)
```
https://travis-ci.org
```

## Web Page por defecto del usuario

Definir un repositorio exactamente

```
amartinr1977.github.io
```