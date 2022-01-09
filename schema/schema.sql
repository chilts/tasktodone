-- Schema

-- Schema: system

CREATE SCHEMA "system";

-- Table: system.status

CREATE TABLE system.status(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rank INT NOT NULL,
  name STRING UNIQUE NOT NULL,
  open BOOLEAN NOT NULL
);

INSERT INTO system.status(rank, name, open) VALUES(10, 'new', true);
INSERT INTO system.status(rank, name, open) VALUES(20, 'started', true);
INSERT INTO system.status(rank, name, open) VALUES(30, 'in-progress', true);
INSERT INTO system.status(rank, name, open) VALUES(40, 'almost-there', true);
INSERT INTO system.status(rank, name, open) VALUES(50, 'finished', false);
INSERT INTO system.status(rank, name, open) VALUES(60, 'cancelled', false); -- usually half way through
INSERT INTO system.status(rank, name, open) VALUES(70, 'ignored', false);
INSERT INTO system.status(rank, name, open) VALUES(80, 'not-doing', false);
INSERT INTO system.status(rank, name, open) VALUES(90, 'no-longer-relevant', false);

-- Schema: content

CREATE SCHEMA "content";

-- Table: content.todo

CREATE TABLE content.todo(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  status_id UUID NOT NULL REFERENCES system.status,
  title STRING NOT NULL,
  label STRING[] NOT NULL DEFAULT ARRAY[],
  inserted TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Table: content.label

CREATE TABLE content.label(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING UNIQUE NOT NULL,
  inserted TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Table: content.todo_label

CREATE TABLE content.todo_label(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  todo_uuid UUID NOT NULL REFERENCES todo,
  label_uuid UUID NOT NULL REFERENCES label,
  inserted TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated TIMESTAMPTZ NOT NULL DEFAULT now()
);


-- (Ends)
