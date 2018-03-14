VER = 8.4.1
html	:
	git pull
	rsync -av /home/nobsun/ghc-build/ghc-$(VER)/docs/users_guide/build-html/users_guide/* .
	git commit -a -m "update"
	git push

