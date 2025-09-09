# Find all .tex files
TEXFILES := $(shell find . -type f -name "*.tex")

# Identify files that need xelatex (files with custom fonts)
CUSTOM_FONT_FILES := ./Cats/text.tex ./Cats/catflyer.tex ./Resumes/oldlatexresume.tex

# Filter out custom font files from regular tex files
REGULAR_TEXFILES := $(filter-out $(CUSTOM_FONT_FILES),$(TEXFILES))
REGULAR_PDFS := $(REGULAR_TEXFILES:.tex=.pdf)

.PHONY: all
all: $(REGULAR_PDFS)

%.pdf: %.tex
	@echo "Compiling $< to $@"
	@cd $(dir $<) && pdflatex -halt-on-error $(notdir $<)

# Define a separate rule to build custom font documents with xelatex if needed
# xelatex-build:
# 	@echo "To compile documents with custom fonts, use: make xelatex-build"
# 	@for file in $(CUSTOM_FONT_FILES); do \
# 		echo "Compiling $$file with xelatex"; \
# 		cd $$(dirname $$file) && xelatex -halt-on-error $$(basename $$file); \
# 	done

.PHONY: clean
clean:
	@find . -type f \( -name "*.log" -o -name "*.aux" -o -name "*.out" \) -delete