Documentation Documentation
===========================

Doc Doc - Goose?
----------------

Here is some documentation about how this documentation is written. Feel free to pitch-in and improve things.

  1. Markdown - This site is written in the [Markdown format](https://daringfireball.net/projects/markdown/syntax).

     Markdown source files are located in: [src/site/markdown](https://github.com/bhamail/picapsule/tree/master/src/site/markdown).
    
  2. You may also find some `README.md` files scattered around the source tree as well.


Doc Publishing
--------------

To deploy these docs to GH Pages, we use [maven-scm-publish-plugin](https://maven.apache.org/plugins/maven-scm-publish-plugin/).

 1. One time - create an empty `gh-pages` branch and push to github.
    
        $ git push
    
    or

        $ git push --set-upstream origin master
    
    then
    
        $ git pull
        $ git symbolic-ref HEAD refs/heads/gh-pages
        $ rm .git/index
        $ git clean -fdx
        $ echo "My GitHub Page" > index.html
        $ git add .
        $ git commit -a -m "First pages commit"
        $ git push origin gh-pages
        $ git checkout master
        
 2. Deploy site to github gh-pages.
  
        git checkout master
        git pull
        mvn clean site-deploy

