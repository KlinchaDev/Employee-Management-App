# Organizacijska Struktura Delavcev

The application provides an overview of the company's organizational structure. Users can browse business units, organizational groups and workers. By selecting a worker, a popup window displays the digital product types assigned to that person.

**Stack:** Vue.js, Node.js, Express, MySQL

---

## Prerequisites

- [Node.js](https://nodejs.org/) installed
- [MySQL](https://www.mysql.com/) installed and running
- MySQL Workbench (or any MySQL client)

---

## 1. Database Setup

1. Open **MySQL Workbench**
2. Go to **Server → Data Import**
3. Import the provided `baza.sql` file
4. This will create a database called `mydb`

> **If your MySQL username or password is different from the defaults**, open `backend/server.js` and update these lines:
> ```js
> user: "root",
> user: "root",
>password: "your_password",
> ```

---

## 2. Starting the Backend

Open a terminal, navigate to the `backend` folder, and run:

```bash
npm install
node server.js
```

> The server will start on **http://localhost:3000**
>
> You only need to run  `npm install` the first time. After that, just use `node server.js`.

---

## 3. Starting the Frontend

Open a **new terminal**, navigate to the `frontend` folder, and run:

```bash
npm install
npm run dev
```

> The app will open at **http://localhost:5173** (or whatever port Vite assigns)

---

## How It Works

The application is structured as follows.

```
Poslovna enota
  → Organizacijska skupina
      → Delavec
          → Tipi digitalnih produktov
```

Click on a business unit to display its groups. Clicking on a group displays its workers, while clicking on a worker opens a popup window with the assigned digital product types.