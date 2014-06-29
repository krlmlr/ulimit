all: inst/NEWS.Rd README.md

gh-pages:
	git subtree split --prefix website --branch gh-pages

inst/NEWS.Rd: NEWS.md
	Rscript -e "tools:::news2Rd('$<', '$@')"
	sed -r -i 's/`([^`]+)`/\\code{\1}/g' $@

README.md: README.Rmd
	Rscript -e "knitr::knit('$<', '$@')"
