html	:
	rsync -av /home/nobsun/src/ghc-8.0.2/docs/users_guide/build-html/users_guide/* .
	git commit -a -m "update"
	git push

