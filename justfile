set dotenv-load

dev cmd:
	go run main.go {{cmd}}

gen:
	sqlc generate

publish:
	sudo go build -o /usr/local/bin/things2obsidian

schema:
	sqlite3 ~/.config/budgeted/db.sqlite '.schema' > internal/db/schema.sql


