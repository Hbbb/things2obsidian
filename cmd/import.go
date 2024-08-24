package cmd

import (
	"fmt"
	"log"

	"github.com/spf13/cobra"
)

var importCmd = &cobra.Command{
	Use: "import",
	Run: func(cmd *cobra.Command, args []string) {
		queries, db, err := NewDB()
		if err != nil {
			log.Fatalf("Failed to connect to the database: %v", err)
		}
		defer db.Close()

		tasks, err := queries.GetTodayTasks(cmd.Context())
		if err != nil {
			log.Fatalf("Failed to get tasks: %v", err)
		}

		// TODO: Process tasks
		for _, task := range tasks {
			fmt.Printf("Title: %s, Notes: %s\n", task.Title, task.Notes)
		}
	},
}

func init() {
	rootCmd.AddCommand(importCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// importCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// importCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
