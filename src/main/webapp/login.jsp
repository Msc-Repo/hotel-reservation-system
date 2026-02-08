<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Ocean View Resort | Staff Login</title>

  <style>
    :root{
      --text:#ffffff;
      --muted:rgba(255,255,255,.75);
      --panel:rgba(10,14,22,.55);
      --panel2:rgba(10,14,22,.35);
      --border:rgba(255,255,255,.14);
      --btn:#f97316;
      --btnHover:#fb923c;
      --shadow: 0 28px 80px rgba(0,0,0,.55);
      --radius: 18px;
    }

    *{ box-sizing:border-box; }

    body{
      margin:0;
      min-height:100vh;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial;
      color: var(--text);
      background:#050812;
    }

    /* Background image */
    .bg{
      position:fixed;
      inset:0;
      background:
              linear-gradient(90deg, rgba(0,0,0,.65), rgba(0,0,0,.35)),
              url("<%=request.getContextPath()%>/assets/img/login-bg.jpg") center/cover no-repeat;
    }

    .wrap{
      position:relative;
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:28px;
    }

    .card{
      width:min(1100px,100%);
      display:grid;
      grid-template-columns: 1.35fr .85fr;
      border-radius: var(--radius);
      overflow:hidden;
      border:1px solid var(--border);
      box-shadow: var(--shadow);
      backdrop-filter: blur(10px);
    }

    /* LEFT PANEL */
    .left{
      padding:52px 48px;
      display:flex;
      flex-direction:column;
      justify-content:space-between;
      background: linear-gradient(180deg, rgba(0,0,0,.35), rgba(0,0,0,.15));
    }

    .left-top h1{
      margin:0;
      font-size: clamp(40px, 4.5vw, 64px);
      font-weight: 800;
      line-height:1.05;
    }

    .left-top .subtitle{
      margin-top:14px;
      font-size:16px;
      font-weight:600;
      color:rgba(255,255,255,.85);
    }

    .left-top .desc{
      margin-top:18px;
      max-width:54ch;
      font-size:14.5px;
      line-height:1.7;
      color:var(--muted);
    }

    /* Social links */
    .social{
      display:flex;
      gap:12px;
      margin-top:24px;
    }

    .social a{
      width:40px;
      height:40px;
      border-radius:50%;
      border:1px solid var(--border);
      background: rgba(255,255,255,.06);
      display:flex;
      align-items:center;
      justify-content:center;
      text-decoration:none;
      color: var(--text);
      font-size:14px;
      font-weight:700;
      transition: background .2s ease, transform .08s ease;
    }

    .social a:hover{
      background: rgba(255,255,255,.12);
    }

    .social a:active{
      transform: translateY(1px);
    }

    /* RIGHT PANEL */
    .right{
      padding:42px 36px;
      background: linear-gradient(180deg, var(--panel), var(--panel2));
      display:flex;
      flex-direction:column;
      justify-content:center;
    }

    .right h2{
      margin:0 0 24px;
      text-align:center;
      font-size:26px;
      font-weight:700;
      letter-spacing:.4px;
    }

    .err{
      margin-bottom:16px;
      padding:10px 12px;
      border-radius: 14px;
      border:1px solid rgba(239,68,68,.40);
      background: rgba(239,68,68,.10);
      color:#fee2e2;
      font-size: 13px;
    }

    label{
      display:block;
      font-size:12px;
      color: var(--muted);
      margin-bottom:6px;
    }

    .field{ margin-bottom:16px; }

    .input{
      width:100%;
      height:44px;
      padding:10px 12px;
      border-radius: 12px;
      border:1px solid rgba(255,255,255,.18);
      background: rgba(0,0,0,.18);
      color: var(--text);
      outline:none;
    }

    .input:focus{
      border-color: rgba(255,255,255,.40);
      box-shadow: 0 0 0 4px rgba(255,255,255,.12);
    }

    .btn{
      width:100%;
      height:46px;
      border:none;
      border-radius: 12px;
      font-weight:800;
      cursor:pointer;
      background: var(--btn);
      color:#0b0f17;
      transition: background .2s ease, transform .08s ease;
    }

    .btn:hover{ background: var(--btnHover); }
    .btn:active{ transform: translateY(1px); }

    .footer{
      margin-top:18px;
      text-align:center;
      font-size:12px;
      color:rgba(255,255,255,.65);
    }

    .success{
      margin-bottom:16px;
      padding:12px 14px;
      border-radius:14px;
      border:1px solid rgba(34,197,94,.45);
      background: rgba(34,197,94,.15);
      color:#dcfce7;
      font-size:13px;
      text-align:center;
    }

    @media (max-width: 900px){
      .card{ grid-template-columns: 1fr; }
      .left{ text-align:center; }
      .left-top .desc{ margin-left:auto; margin-right:auto; }
      .social{ justify-content:center; }
    }
  </style>
</head>

<body>
<div class="bg"></div>

<div class="wrap">
  <div class="card">

    <!-- LEFT -->
    <section class="left">
      <div class="left-top">
        <h1>Welcome Back</h1>
        <div class="subtitle">Ocean View Resort – Staff Portal</div>

        <div class="desc">
          This secure internal platform enables authorized staff to manage
          room reservations, guest information, and billing operations with
          efficiency and accuracy.
          <br/><br/>
          Access is restricted to registered personnel only.
        </div>
      </div>

      <div class="social">
        <a href="#" title="Facebook" onclick="return false;">f</a>
        <a href="#" title="Instagram" onclick="return false;">ig</a>
        <a href="#" title="Twitter" onclick="return false;">x</a>
        <a href="#" title="YouTube" onclick="return false;">yt</a>
      </div>
    </section>

    <!-- RIGHT -->
    <section class="right">
      <h2>Staff Login</h2>

      <% String error = (String) request.getAttribute("error"); %>
      <% String success = (String) request.getAttribute("success"); %>

      <% if (error != null) { %>
      <div class="err"><%= error %></div>
      <% } %>

      <% if (success != null) { %>
      <div class="success"><%= success %></div>

      <script>
        setTimeout(function () {
          window.location.href = "<%= request.getAttribute("redirectUrl") %>";
        }, 2000);
      </script>
      <% } %>

      <form method="post" action="<%= request.getContextPath() %>/login">
        <div class="field">
          <label for="username">Username</label>
          <input class="input" id="username" name="username" type="text" required />
        </div>

        <div class="field">
          <label for="password">Password</label>
          <input class="input" id="password" name="password" type="password" required />
        </div>

        <button class="btn" type="submit">Authenticate</button>
      </form>

      <div class="footer">
        © Ocean View Resort • Authorized Personnel Only
      </div>
    </section>

  </div>
</div>
</body>
</html>
