CREATE TABLE IF NOT EXISTS 'Meta'
(
    'key'   TEXT PRIMARY KEY,
    'value' TEXT
);
CREATE TABLE IF NOT EXISTS 'TMArea'
(
    'uuid'       TEXT PRIMARY KEY,
    'title'      TEXT,
    'visible'    INTEGER,
    'index'      INTEGER,
    'cachedTags' BLOB,
    experimental BLOB
);
CREATE TABLE IF NOT EXISTS 'TMTag'
(
    'uuid'       TEXT PRIMARY KEY,
    'title'      TEXT,
    'shortcut'   TEXT,
    'usedDate'   REAL,
    'parent'     TEXT,
    'index'      INTEGER,
    experimental BLOB
);
CREATE TABLE IF NOT EXISTS 'TMContact'
(
    'uuid'               TEXT PRIMARY KEY,
    'displayName'        TEXT,
    'firstName'          TEXT,
    'lastName'           TEXT,
    'emails'             TEXT,
    'appleAddressBookId' TEXT,
    'index'              INTEGER
);
CREATE TABLE IF NOT EXISTS 'TMMetaItem'
(
    'uuid'  TEXT PRIMARY KEY,
    'value' BLOB
);
CREATE TABLE IF NOT EXISTS "BSSyncronyMetadata"
(
    'uuid'  TEXT PRIMARY KEY,
    'value' BLOB
);
CREATE TABLE IF NOT EXISTS 'TMSettings'
(
    'uuid'                         TEXT PRIMARY KEY,
    'logInterval'                  INTEGER,
    'manualLogDate'                REAL,
    'groupTodayByParent'           INTEGER,
    'uriSchemeAuthenticationToken' TEXT,
    experimental                   BLOB
);
CREATE TABLE IF NOT EXISTS 'TMTaskTag'
(
    'tasks' TEXT NOT NULL,
    'tags'  TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS 'TMAreaTag'
(
    'areas' TEXT NOT NULL,
    'tags'  TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS 'TMChecklistItem'
(
    'uuid'                 TEXT PRIMARY KEY,
    'userModificationDate' REAL,
    'creationDate'         REAL,
    'title'                TEXT,
    'status'               INTEGER,
    'stopDate'             REAL,
    'index'                INTEGER,
    'task'                 TEXT,
    'leavesTombstone'      INTEGER,
    experimental           BLOB
);
CREATE TABLE IF NOT EXISTS 'TMCommand'
(
    'uuid'         TEXT PRIMARY KEY,
    'creationDate' REAL,
    'type'         INTEGER,
    'info'         BLOB
);
CREATE INDEX 'index_TMCommand_creationDate' ON 'TMCommand' ('creationDate');
CREATE TABLE IF NOT EXISTS 'TMTombstone'
(
    'uuid'              TEXT PRIMARY KEY,
    'deletionDate'      REAL,
    'deletedObjectUUID' TEXT
);
CREATE INDEX index_TMTaskTag_tasks ON TMTaskTag (tasks);
CREATE INDEX index_TMAreaTag_areas ON TMAreaTag (areas);
CREATE INDEX index_TMChecklistItem_task ON TMChecklistItem (task);
CREATE INDEX index_TMTombstone_deletedObjectUUID ON TMTombstone (deletedObjectUUID);
CREATE TABLE TMTask
(

    "uuid"                             TEXT PRIMARY KEY,
    "leavesTombstone"                  INTEGER,

    "creationDate"                     REAL,
    "userModificationDate"             REAL,

    "type"                             INTEGER,

    "status"                           INTEGER,
    "stopDate"                         REAL,

    "trashed"                          INTEGER,

    "title"                            TEXT,
    "notes"                            TEXT,
    "notesSync"                        INTEGER,

    "cachedTags"                       BLOB,

    "start"                            INTEGER,
    "startDate"                        INTEGER, -- REAL -> INTEGER
    "startBucket"                      INTEGER,
    "reminderTime"                     INTEGER,
    "lastReminderInteractionDate"      REAL,    -- Renamed from "lastAlarmInteractionDate"

    "deadline"                         INTEGER, -- Renamed from "dueDate", REAL -> INTEGER
    "deadlineSuppressionDate"          INTEGER, -- Renamed from "dueDateSuppressionDate", REAL -> INTEGER
    "t2_deadlineOffset"                INTEGER, -- Renamed from "dueDateOffset"

    "index"                            INTEGER,
    "todayIndex"                       INTEGER,
    "todayIndexReferenceDate"          INTEGER, -- REAL -> INTEGER

    "area"                             TEXT,
    "project"                          TEXT,
    "heading"                          TEXT,    -- Renamed from "actionGroup"
    "contact"                          TEXT,    -- Renamed from "delegate"

    "untrashedLeafActionsCount"        INTEGER,
    "openUntrashedLeafActionsCount"    INTEGER,

    "checklistItemsCount"              INTEGER,
    "openChecklistItemsCount"          INTEGER,

    "rt1_repeatingTemplate"            TEXT,    -- Renamed from "repeatingTemplate"
    "rt1_recurrenceRule"               BLOB,    -- Renamed from "recurrenceRule"
    "rt1_instanceCreationStartDate"    INTEGER, -- Renamed from "instanceCreationStartDate", REAL -> INTEGER
    "rt1_instanceCreationPaused"       INTEGER, -- Renamed from "instanceCreationPaused"
    "rt1_instanceCreationCount"        INTEGER, -- Renamed from "instanceCreationCount"
    "rt1_afterCompletionReferenceDate" INTEGER, -- Renamed from "afterCompletionReferenceDate", REAL -> INTEGER
    "rt1_nextInstanceStartDate"        INTEGER, -- Renamed from "nextInstanceStartDate", REAL -> INTEGER

    "experimental"                     BLOB,

    "repeater"                         BLOB,
    "repeaterMigrationDate"            REAL
);
CREATE INDEX index_TMTask_stopDate ON TMTask (stopDate);
CREATE INDEX index_TMTask_project ON TMTask (project);
CREATE INDEX index_TMTask_heading ON TMTask (heading);
CREATE INDEX index_TMTask_area ON TMTask (area);
CREATE INDEX index_TMTask_repeatingTemplate ON TMTask (rt1_repeatingTemplate);
CREATE TABLE IF NOT EXISTS "ThingsTouch_ExtensionCommandStore_Meta"
(
    "key"   TEXT PRIMARY KEY,
    "value" BLOB
);
CREATE TABLE IF NOT EXISTS "ThingsTouch_ExtensionCommandStore_Commands"
(
    "id"   INTEGER PRIMARY KEY AUTOINCREMENT,
    "type" TEXT,
    "body" BLOB
);
CREATE TABLE sqlite_sequence
(
    name,
    seq
);
