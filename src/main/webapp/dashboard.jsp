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
  <title>Ocean View Resort | Dashboard</title>

  <style>
    :root{
      --bg:#0b1220;
      --panel: rgba(255,255,255,.04);
      --panel2: rgba(255,255,255,.06);
      --border: rgba(255,255,255,.10);
      --text:#e5e7eb;
      --muted: rgba(229,231,235,.75);
      --brand1:#38bdf8;
      --brand2:#22c55e;
      --danger:#ef4444;
      --shadow: 0 18px 60px rgba(0,0,0,.45);
      --radius: 16px;
    }

    *{ box-sizing:border-box; }
    body{
      margin:0;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial;
      background:
              radial-gradient(900px 500px at 15% 10%, rgba(56,189,248,.14), transparent 60%),
              radial-gradient(900px 500px at 85% 20%, rgba(34,197,94,.12), transparent 60%),
              var(--bg);
      color: var(--text);
    }

    .layout{
      min-height:100vh;
      display:grid;
      grid-template-columns: 280px 1fr;
    }

    /* SIDEBAR */
    .sidebar{
      border-right:1px solid var(--border);
      background: rgba(10,14,22,.62);
      backdrop-filter: blur(10px);
      padding:18px 14px;
      display:flex;
      flex-direction:column;
      gap:14px;
    }

    .brand{
      border:1px solid var(--border);
      background: rgba(255,255,255,.04);
      border-radius: var(--radius);
      padding:14px 14px;
      box-shadow: var(--shadow);
    }

    .brand .title{
      display:flex;
      align-items:center;
      gap:10px;
      font-weight:800;
      letter-spacing:.2px;
    }

    .logo{
      width:38px;
      height:38px;
      border-radius:12px;
      background: linear-gradient(135deg, var(--brand1), var(--brand2));
      box-shadow: 0 10px 25px rgba(0,0,0,.35);
    }

    .brand small{
      display:block;
      margin-top:6px;
      color: var(--muted);
      font-size:12px;
      line-height:1.4;
    }

    .nav{
      display:flex;
      flex-direction:column;
      gap:8px;
    }

    .nav button{
      width:100%;
      text-align:left;
      border:1px solid transparent;
      background: transparent;
      color: var(--text);
      padding:12px 12px;
      border-radius: 14px;
      cursor:pointer;
      display:flex;
      align-items:center;
      justify-content:space-between;
      transition: background .2s ease, border-color .2s ease, transform .06s ease;
      font-weight:650;
      font-size:14px;
    }

    .nav button:hover{
      background: rgba(255,255,255,.06);
      border-color: rgba(255,255,255,.10);
    }

    .nav button:active{ transform: translateY(1px); }

    .nav button.active{
      background: linear-gradient(90deg, rgba(56,189,248,.16), rgba(34,197,94,.14));
      border-color: rgba(255,255,255,.14);
    }

    .chip{
      font-size:11px;
      color: rgba(229,231,235,.75);
      border:1px solid rgba(255,255,255,.12);
      padding:4px 8px;
      border-radius: 999px;
      background: rgba(255,255,255,.03);
    }

    .sidebar-footer{
      margin-top:auto;
      border-top:1px solid rgba(255,255,255,.08);
      padding-top:12px;
      color: var(--muted);
      font-size:12px;
      line-height:1.5;
    }

    /* MAIN */
    .main{
      padding:18px 18px 26px;
    }

    .topbar{
      display:flex;
      align-items:center;
      justify-content:space-between;
      gap:12px;
      padding:14px 16px;
      border:1px solid var(--border);
      border-radius: var(--radius);
      background: rgba(255,255,255,.04);
      box-shadow: var(--shadow);
    }

    .hello{
      display:flex;
      flex-direction:column;
      gap:2px;
    }
    .hello strong{
      font-size:16px;
    }
    .hello span{
      color: var(--muted);
      font-size:12px;
    }

    .actions{
      display:flex;
      gap:10px;
      align-items:center;
    }

    .btn{
      border:none;
      cursor:pointer;
      border-radius: 12px;
      padding:10px 14px;
      font-weight:800;
      background: linear-gradient(90deg, var(--brand1), var(--brand2));
      color:#061014;
    }
    .btn:active{ transform: translateY(1px); }

    .btn-outline{
      border:1px solid rgba(255,255,255,.14);
      background: rgba(255,255,255,.04);
      color: var(--text);
      padding:10px 14px;
      border-radius: 12px;
      cursor:pointer;
      font-weight:750;
    }

    .content{
      margin-top:14px;
      border:1px solid var(--border);
      border-radius: var(--radius);
      background: rgba(255,255,255,.04);
      box-shadow: var(--shadow);
      padding:18px;
      min-height: 520px;
    }

    .grid{
      display:grid;
      grid-template-columns: repeat(3, 1fr);
      gap:12px;
      margin-top:12px;
    }
    .stat{
      border:1px solid rgba(255,255,255,.10);
      background: rgba(255,255,255,.03);
      border-radius: 14px;
      padding:14px;
    }
    .stat .k{
      color: var(--muted);
      font-size:12px;
    }
    .stat .v{
      margin-top:6px;
      font-size:20px;
      font-weight:900;
    }

    .section-title{
      margin:0;
      font-size:18px;
      letter-spacing:-0.01em;
    }
    .section-sub{
      margin:6px 0 0;
      color: var(--muted);
      font-size:13px;
      line-height:1.6;
      max-width: 85ch;
    }

    .panel{
      margin-top:14px;
      border:1px solid rgba(255,255,255,.10);
      background: rgba(255,255,255,.03);
      border-radius: 14px;
      padding:14px;
    }

    ul.clean{
      margin:10px 0 0 18px;
      color: rgba(229,231,235,.85);
      line-height:1.65;
      font-size:13.5px;
    }

    .note{
      margin-top:12px;
      color: rgba(229,231,235,.72);
      font-size:12px;
    }

    @media (max-width: 980px){
      .layout{ grid-template-columns: 1fr; }
      .sidebar{ position:sticky; top:0; z-index:5; }
      .grid{ grid-template-columns: 1fr; }
    }
  </style>
</head>

<body>
<div class="layout">

  <!-- SIDEBAR -->
  <aside class="sidebar">
    <div class="brand">
      <div class="title">
        <div class="logo"></div>
        <div>
          Ocean View Resort
          <div style="font-size:12px; color:var(--muted); font-weight:650;">Reservation System</div>
        </div>
      </div>
      <small>
        Secure staff portal for reservations, guest records, billing and reports.
      </small>
    </div>

    <nav class="nav">
      <button class="active" data-view="home">
        <span>Dashboard</span>
        <span class="chip">Home</span>
      </button>
      <button data-view="addRes">
        <span>Add Reservation</span>
        <span class="chip">New</span>
      </button>
      <button data-view="viewRes">
        <span>View Reservation</span>
        <span class="chip">Search</span>
      </button>
      <button data-view="billing">
        <span>Billing</span>
        <span class="chip">Bill</span>
      </button>
      <button data-view="reports">
        <span>Reports</span>
        <span class="chip">PDF</span>
      </button>
      <button data-view="help">
        <span>Help</span>
        <span class="chip">Guide</span>
      </button>
    </nav>

    <div class="sidebar-footer">
      Logged in as: <b><%= username %></b><br/>
      Version: <b>v1.0</b><br/>
      © Ocean View Resort
    </div>
  </aside>

  <!-- MAIN -->
  <main class="main">
    <div class="topbar">
      <div class="hello">
        <strong>Welcome, <%= username %></strong>
        <span>Ocean View Resort — Staff Dashboard</span>
      </div>

      <div class="actions">
        <button class="btn-outline" type="button" onclick="openHelp()">Quick Help</button>

        <!-- Logout with confirmation -->
        <button class="btn" type="button" onclick="confirmLogout()">Logout</button>
      </div>
    </div>

    <section class="content" id="contentArea">
      <!-- Default view -->
      <h2 class="section-title">Dashboard Overview</h2>
      <p class="section-sub">
        Use the navigation on the left to manage reservations, view booking details, calculate bills,
        and generate reports. This interface follows MVC + DAO architecture with secure session-based access.
      </p>

      <div class="grid">
        <div class="stat">
          <div class="k">Reservations</div>
          <div class="v">—</div>
          <div class="note">Will show total reservations after we connect DB queries.</div>
        </div>
        <div class="stat">
          <div class="k">Active Guests</div>
          <div class="v">—</div>
          <div class="note">Will show guest count after guest table is added.</div>
        </div>
        <div class="stat">
          <div class="k">Pending Bills</div>
          <div class="v">—</div>
          <div class="note">Will show pending billing once billing module is added.</div>
        </div>
      </div>

      <div class="panel">
        <h3 style="margin:0; font-size:15px;">Next Modules (We will implement)</h3>
        <ul class="clean">
          <li>Add Reservation (validation + DB storage)</li>
          <li>View Reservation (search by reservation ID)</li>
          <li>Calculate Bill (nights × room rate)</li>
          <li>Reports (daily bookings, revenue summary)</li>
          <li>Help page for staff training</li>
        </ul>
      </div>
    </section>
  </main>

</div>

<script>
  // Dynamic content templates (no page refresh)
  const views = {
    home: `
      <h2 class="section-title">Dashboard Overview</h2>
      <p class="section-sub">
        Use the navigation on the left to manage reservations, view booking details, calculate bills,
        and generate reports. This interface follows MVC + DAO architecture with secure session-based access.
      </p>

      <div class="grid">
        <div class="stat">
          <div class="k">Reservations</div>
          <div class="v">—</div>
          <div class="note">Will show total reservations after we connect DB queries.</div>
        </div>
        <div class="stat">
          <div class="k">Active Guests</div>
          <div class="v">—</div>
          <div class="note">Will show guest count after guest table is added.</div>
        </div>
        <div class="stat">
          <div class="k">Pending Bills</div>
          <div class="v">—</div>
          <div class="note">Will show pending billing once billing module is added.</div>
        </div>
      </div>

      <div class="panel">
        <h3 style="margin:0; font-size:15px;">Next Modules (We will implement)</h3>
        <ul class="clean">
          <li>Add Reservation (validation + DB storage)</li>
          <li>View Reservation (search by reservation ID)</li>
          <li>Calculate Bill (nights × room rate)</li>
          <li>Reports (daily bookings, revenue summary)</li>
          <li>Help page for staff training</li>
        </ul>
      </div>
    `,

    addRes: `
      <h2 class="section-title">Add Reservation</h2>
      <p class="section-sub">We will build the reservation form next (JSP + Servlet + DAO) with full validation.</p>
      <div class="panel">
        <b>Coming next:</b>
        <ul class="clean">
          <li>Guest name, contact, room type, check-in, check-out</li>
          <li>Date validation (check-out must be after check-in)</li>
          <li>Save to MySQL</li>
        </ul>
      </div>
    `,

    viewRes: `
      <h2 class="section-title">View Reservation</h2>
      <p class="section-sub">We will add a search by Reservation ID and display full booking details.</p>
      <div class="panel">
        <b>Coming next:</b>
        <ul class="clean">
          <li>Search box + result table</li>
          <li>Error message if reservation not found</li>
        </ul>
      </div>
    `,

    billing: `
      <h2 class="section-title">Billing</h2>
      <p class="section-sub">We will calculate total cost based on number of nights × room rate.</p>
      <div class="panel">
        <b>Coming next:</b>
        <ul class="clean">
          <li>Calculate nights automatically</li>
          <li>Display bill summary</li>
          <li>Print / export bill text</li>
        </ul>
      </div>
    `,

    reports: `
      <h2 class="section-title">Reports</h2>
      <p class="section-sub">We will create valuable reports for the hotel management.</p>
      <div class="panel">
        <b>Coming next:</b>
        <ul class="clean">
          <li>Daily reservations report</li>
          <li>Room type popularity</li>
          <li>Revenue summary</li>
        </ul>
      </div>
    `,

    help: `
      <h2 class="section-title">Help & Guidelines</h2>
      <p class="section-sub">
        This section will provide step-by-step guidance for new staff on using the system.
      </p>
      <div class="panel">
        <b>Help topics:</b>
        <ul class="clean">
          <li>How to add a reservation</li>
          <li>How to search reservation details</li>
          <li>How to calculate and print bills</li>
          <li>How to generate reports</li>
        </ul>
      </div>
    `
  };

  const contentArea = document.getElementById("contentArea");
  const navButtons = document.querySelectorAll(".nav button");

  navButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      navButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");

      const view = btn.getAttribute("data-view");
      contentArea.innerHTML = views[view] || views.home;
    });
  });

  function confirmLogout(){
    const ok = window.confirm("Are you sure you want to logout?");
    if(ok){
      window.location.href = "<%= request.getContextPath() %>/logout";
    }
  }

  function openHelp(){
    // Switch to help view automatically
    navButtons.forEach(b => b.classList.remove("active"));
    document.querySelector('.nav button[data-view="help"]').classList.add("active");
    contentArea.innerHTML = views.help;
  }
</script>

</body>
</html>
