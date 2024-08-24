package cmd

import (
	"database/sql"
	"errors"
	"os"

	"github.com/hbbb/things2obsidian/db"
	_ "github.com/mattn/go-sqlite3"
)

// NewDB initializes and returns a new database connection and the SQLC wrapper for it.
func NewDB() (*db.Queries, *sql.DB, error) {
	dbPath := os.Getenv("THINGS_SQLITE_PATH")
	if dbPath == "" {
		return nil, nil, errors.New("THINGS_SQLITE_PATH environment variable is not set")
	}

	conn, err := sql.Open("sqlite3", dbPath)
	if err != nil {
		return nil, nil, err
	}
	if err := conn.Ping(); err != nil {
		return nil, nil, err
	}

	queries := db.New(conn)
	return queries, conn, nil
}
