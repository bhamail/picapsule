Documentation Documentation
===========================

Doc, Doc - Goose?
----------------

Here is some documentation about how this documentation is written. Feel free to pitch-in and improve things.

  1. Markdown - This site is written in the [Markdown format](https://daringfireball.net/projects/markdown/syntax).

     Markdown source files are located in: [src/site/markdown](https://github.com/bhamail/picapsule/tree/master/src/site/markdown).
    
  2. Run the following command to build a local copy of the website:

     ```shell
     ./mvnw clean site
     ```

     You can view the local site by opening: `./target/site/index.html`

     Contributions are welcomed!!!


Doc Publishing
--------------

These notes are just for me to remember what I did:

To deploy these docs to GH Pages, we use [maven-scm-publish-plugin](https://maven.apache.org/plugins/maven-scm-publish-plugin/).

 1. One time - create an empty `gh-pages` branch and push to GitHub.
    
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
        
 2. Deploy site to GitHub gh-pages.
  
        git checkout master
        git pull
        mvn clean site-deploy

