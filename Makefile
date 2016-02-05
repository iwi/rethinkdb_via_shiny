db-install:
	@docker run -d --name db --net junt -p 8080:8080 rethinkdb

db-create:
	@docker run --rm -it --net junt -v $(PWD):/source iwi/python_db python create_db_test.py

db-create_table_materials:
	@docker run --rm -it --net junt -v $(PWD):/source iwi/python_db python create_table_materials.py

nw-create:
	@docker network create junt

db-clean:
	@docker rm -vf db

count:
	@docker run --rm -it --net junt -v $(PWD):/source iwi/python_db python test.py

shiny:
	@docker run --rm -it --net junt -p 3838:3838 -v $(PWD):/srv/shiny-server/ iwi/db_ui_stack2
