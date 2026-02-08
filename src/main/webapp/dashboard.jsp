<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
    response.sendRedirect(request.getContextPath() + "/login");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dashboard</title>
  <style>
    body{
      margin:0;
      font-family: system-ui, Arial;
      background:#0b1220;
      color:#e5e7eb;
      padding:24px;
    }
    .card{
      max-width:900px;
      margin:0 auto;
      background: rgba(255,255,255,.04);
      border:1px solid rgba(255,255,255,.10);
      border-radius:16px;
      padding:20px;
    }
    .top{
      display:flex;
      justify-content:space-between;
      align-items:center;
      gap:10px;
    }
    a.btn{
      color:#061014;
      background: linear-gradient(90deg,#38bdf8,#22c55e);
      text-decoration:none;
      padding:10px 14px;
      border-radius:12px;
      font-weight:700;
    }
    .muted{ color: rgba(229,231,235,.75); }
  </style>
</head>
<body>
<div class="card">
  <div class="top">
    <div>
      <h2 style="margin:0;">Welcome, <%= username %> 👋</h2>
      <p class="muted" style="margin:6px 0 0;">Ocean View Resort Reservation System</p>
    </div>
    <a class="btn" href="<%= request.getContextPath() %>/logout">Logout</a>
  </div>

  <hr style="border-color: rgba(255,255,255,.12); margin:16px 0;"/>

  <p>Next we will add:</p>
  <ul>
    <li>Add Reservation</li>
    <li>View Reservation</li>
    <li>Billing</li>
    <li>Reports</li>
  </ul>
</div>
</body>
</html>
