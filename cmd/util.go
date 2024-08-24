package cmd

import (
	"database/sql"

	"github.com/hbbb/things2obsidian/db"
	_ "github.com/mattn/go-sqlite3"
)

// NewDB initializes and returns a new database connection and the SQLC wrapper for it.
func NewDB(path string) (*db.Queries, *sql.DB, error) {
	conn, err := sql.Open("sqlite3", path)
	if err != nil {
		return nil, nil, err
	}
	if err := conn.Ping(); err != nil {
		return nil, nil, err
	}

	queries := db.New(conn)
	return queries, conn, nil
}
