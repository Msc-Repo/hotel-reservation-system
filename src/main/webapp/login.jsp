<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ocean View Resort | Login</title>

  <style>
    :root{
      --bg1:#0b1220;
      --bg2:#0f1d3a;
      --card:#0f172a;
      --border:rgba(255,255,255,.10);
      --text:#e5e7eb;
      --muted:rgba(229,231,235,.75);
      --accent:#22c55e;
      --accent2:#38bdf8;
      --danger:#ef4444;
      --shadow: 0 20px 60px rgba(0,0,0,.45);
      --radius: 18px;
    }

    *{ box-sizing:border-box; }
    body{
      margin:0;
      min-height:100vh;
      font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Arial, "Apple Color Emoji","Segoe UI Emoji";
      color:var(--text);
      background:
              radial-gradient(1100px 600px at 15% 10%, rgba(56,189,248,.22), transparent 60%),
              radial-gradient(900px 500px at 85% 20%, rgba(34,197,94,.18), transparent 60%),
              linear-gradient(180deg, var(--bg1), var(--bg2));
      display:flex;
      align-items:center;
      justify-content:center;
      padding:28px;
    }

    .wrap{
      width: min(1020px, 100%);
      display:grid;
      grid-template-columns: 1.1fr .9fr;
      gap:24px;
      align-items:stretch;
    }

    .hero{
      border:1px solid var(--border);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow:hidden;
      position:relative;
      background:
              linear-gradient(135deg, rgba(56,189,248,.18), transparent 55%),
              linear-gradient(225deg, rgba(34,197,94,.16), transparent 55%),
              rgba(15,23,42,.72);
      padding:28px;
    }

    .badge{
      display:inline-flex;
      align-items:center;
      gap:10px;
      border:1px solid var(--border);
      background: rgba(255,255,255,.04);
      padding:10px 12px;
      border-radius:999px;
      font-size:13px;
      color:var(--muted);
      backdrop-filter: blur(8px);
    }
    .dot{
      width:10px;height:10px;border-radius:999px;
      background: linear-gradient(90deg, var(--accent2), var(--accent));
      box-shadow: 0 0 0 6px rgba(56,189,248,.12);
    }

    h1{
      margin:18px 0 8px;
      font-size: clamp(28px, 3.4vw, 44px);
      line-height:1.05;
      letter-spacing:-0.02em;
    }
    .sub{
      margin:0;
      max-width:46ch;
      color: var(--muted);
      font-size: 15px;
      line-height:1.6;
    }

    .stats{
      margin-top:22px;
      display:grid;
      grid-template-columns: repeat(3, 1fr);
      gap:12px;
    }
    .stat{
      border:1px solid var(--border);
      background: rgba(255,255,255,.03);
      border-radius: 14px;
      padding:14px;
    }
    .stat .k{
      font-size:12px;
      color:var(--muted);
    }
    .stat .v{
      margin-top:6px;
      font-size:18px;
      font-weight:700;
    }

    .card{
      border:1px solid var(--border);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      background: rgba(15,23,42,.82);
      padding:26px;
    }
    .card h2{
      margin:0 0 6px;
      font-size:20px;
    }
    .card p{
      margin:0 0 18px;
      color:var(--muted);
      font-size:14px;
      line-height:1.5;
    }

    .field{
      margin-bottom:12px;
    }
    label{
      display:block;
      font-size:12px;
      color:var(--muted);
      margin:0 0 6px;
    }
    .input{
      width:100%;
      padding:12px 12px;
      border-radius: 14px;
      border:1px solid rgba(255,255,255,.12);
      background: rgba(2,6,23,.35);
      color:var(--text);
      outline:none;
    }
    .input:focus{
      border-color: rgba(56,189,248,.55);
      box-shadow: 0 0 0 4px rgba(56,189,248,.16);
    }

    .row{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:12px;
      margin:10px 0 16px;
    }

    .hint{
      font-size:12px;
      color: var(--muted);
    }

    .btn{
      width:100%;
      border: none;
      border-radius: 14px;
      padding:12px 14px;
      font-weight:700;
      cursor:pointer;
      color:#061014;
      background: linear-gradient(90deg, var(--accent2), var(--accent));
      transition: transform .06s ease, filter .2s ease;
    }
    .btn:active{ transform: translateY(1px); }
    .btn:hover{ filter: brightness(1.05); }

    .err{
      margin: 0 0 14px;
      padding:10px 12px;
      border-radius: 14px;
      border:1px solid rgba(239,68,68,.35);
      background: rgba(239,68,68,.10);
      color: #fecaca;
      font-size: 13px;
    }

    .footer{
      margin-top:14px;
      font-size:12px;
      color:var(--muted);
      text-align:center;
    }

    @media (max-width: 900px){
      .wrap{ grid-template-columns: 1fr; }
      .stats{ grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

<div class="wrap">

  <section class="hero">
    <div class="badge">
      <span class="dot"></span>
      Ocean View Resort • Room Reservation System
    </div>

    <h1>Welcome back 👋</h1>
    <p class="sub">
      Log in to manage guest reservations, view booking details, and generate bills safely.
      This system is built with Java EE (Servlets + JSP) and MySQL.
    </p>

    <div class="stats">
      <div class="stat">
        <div class="k">Security</div>
        <div class="v">Session Login</div>
      </div>
      <div class="stat">
        <div class="k">Storage</div>
        <div class="v">MySQL (XAMPP)</div>
      </div>
      <div class="stat">
        <div class="k">Architecture</div>
        <div class="v">MVC + DAO</div>
      </div>
    </div>
  </section>

  <section class="card">
    <h2>Staff Login</h2>
    <p>Enter your credentials to access the reservation dashboard.</p>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="err"><%= error %></div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/login">
      <div class="field">
        <label for="username">Username</label>
        <input class="input" id="username" name="username" type="text" placeholder="e.g. admin" required />
      </div>

      <div class="field">
        <label for="password">Password</label>
        <input class="input" id="password" name="password" type="password" placeholder="••••••••" required />
      </div>

      <div class="row">
        <span class="hint">Tip: Use the demo user you inserted in DB.</span>
      </div>

      <button class="btn" type="submit">Sign in</button>
    </form>

    <div class="footer">
      © Ocean View Resort • Internal Use Only
    </div>
  </section>

</div>

</body>
</html>
