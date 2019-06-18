<?php

class Task
{
    private $conn;
    private $table_name = "tasks";

    public $id;
    public $user_id;
    public $title;
    public $description;
    public $due_date;
    public $priority;
    public $active;
    public $created;
    public $modified;
    public $order;
    public $order_by;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "SELECT
                u.email email, t.id, t.user_id, t.title, t.description, t.active, t.due_date, t.priority, t.modified, t.created
            FROM
                " . $this->table_name . " t
                LEFT JOIN
                    users u
                        ON t.user_id = u.id
            ORDER BY
                t.created DESC";

        $stmt = $this->conn->prepare($query);

        $stmt->execute();

        return $stmt;
    }

    public function create()
    {
        $query = "INSERT INTO
                " . $this->table_name . "
            SET
                user_id=:user_id, 
                title=:title,
                description=:description, 
                active=:active,
                due_date=:due_date,
                priority=:priority, 
                modified=:modified, 
                created=:created";

        $stmt = $this->conn->prepare($query);

        $this->description = htmlspecialchars(strip_tags($this->description));

        $stmt->bindParam(":user_id", $this->user_id);
        $stmt->bindParam(":title", $this->title);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":active", $this->active);
        $stmt->bindParam(":due_date", $this->due_date);
        $stmt->bindParam(":priority", $this->priority);
        $stmt->bindParam(":modified", $this->created);
        $stmt->bindParam(":created", $this->created);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    public function update()
    {
        $query = "UPDATE
                " . $this->table_name . "
            SET
                title = :title,
                description = :description,
                user_id = :user_id,
                active = :active,
                due_date = :due_date,
                priority = :priority,
                modified = NOW()
            WHERE
                id = :id";

        $stmt = $this->conn->prepare($query);

        $this->title = htmlspecialchars(strip_tags($this->title));
        $this->description = htmlspecialchars(strip_tags($this->description));
        $this->user_id = htmlspecialchars(strip_tags($this->user_id));
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->active = htmlspecialchars(strip_tags($this->active));
        $this->due_date = htmlspecialchars(strip_tags($this->due_date));
        $this->priority = htmlspecialchars(strip_tags($this->priority));

        $stmt->bindParam(':title', $this->title);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':user_id', $this->user_id);
        $stmt->bindParam(':active', $this->active);
        $stmt->bindParam('due_date', $this->due_date);
        $stmt->bindParam(":priority", $this->priority);
        $stmt->bindParam(':id', $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    public function delete()
    {
        $query = "DELETE FROM " . $this->table_name . " WHERE id = ?";

        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    public function readPaging($from_record_num, $records_per_page, $user_id, $order, $order_by)
    {
        $order = $order == "DESC" ? "DESC" : "ASC";

        $order_by = in_array($order_by, ['title', 'due_date', 'priority']) ? $order_by : 'id';

        $query = "SELECT
                u.email as email, t.id, t.title, t.description, t.active, t.due_date, t.priority, t.modified, t.created
            FROM
                " . $this->table_name . " t
                LEFT JOIN
                    users u
                        ON t.user_id = u.id
            WHERE u.id = {$user_id}
            ORDER BY t.{$order_by} {$order}
            LIMIT ?, ?";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(1, $from_record_num, PDO::PARAM_INT);
        $stmt->bindParam(2, $records_per_page, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt;
    }

    public function count()
    {
        $query = "SELECT COUNT(*) as total_rows FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row['total_rows'];
    }
}
