<%@page import="model.Stock"%>
<%@page import="java.util.List"%>
<%@page import="dao.StockDAO"%>
<%@page import="model.Pharmacy"%>
<%@page import="dao.PharmacyDAO"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>       
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Pharmacy - HealHub</title>
    
    <link rel="icon" type="image/png" href="favicon.png">
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>
    
    <style>
        
        body {
            font-family: 'Inter', sans-serif;
            }
    </style>
</head>
<body class="bg-gradient-to-br from-blue-50 to-green-50">
    
     <%
        
            String email = (String)session.getAttribute("email");
            
            if(email==null || email.trim().equals(""))
            {
                response.sendRedirect("login.jsp");
            }
            
            
            
            String pharmacy_id = (String)request.getParameter("pharmacy_id");
            
            if(pharmacy_id==null)
            {
                pharmacy_id = (String)session.getAttribute("pharmacy_id");
            }
            
            session.setAttribute("pharmacy_id", pharmacy_id);
            
            Pharmacy p = PharmacyDAO.getPharmacyData(pharmacy_id);
            
            session.setAttribute("pharmacyData", p);
            
            String pharmacyName = p.getPname();
            
            User u = (User)session.getAttribute("userData");
            String name = u.getUsername();
            
            
            
        %>
    
    <!-- Main Container -->
    <div class="flex h-screen overflow-hidden">
        
        <!-- Sidebar -->
        <aside class="w-64 bg-white shadow-lg flex flex-col">
            <!-- Logo Section -->
            <div class="p-6 border-b border-gray-200">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 bg-teal-500 p-1.5 rounded-lg flex items-center justify-center">
                        <i data-lucide="pill" class="h-6 w-6 text-white"></i>
                    </div>
                    <div>
                        <h1 class="font-bold text-lg text-gray-800">HealHub</h1>
                        <p class="text-xs text-gray-500">Pharmacy Locator</p>
                    </div>
                </div>
            </div>
            
            <!-- Navigation Menu -->
            <nav class="flex-1 p-4 overflow-y-auto">
                <ul class="space-y-1">
                    <li>
                        <a href="UserManagePharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-blue-50 transition">
                            <i data-lucide="undo-2" class="w-5 h-5"></i>
                            <span>Back</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="addMedicine.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-blue-50 transition">
                            <i data-lucide="plus" class="w-5 h-5"></i>
                            <span>New Stock</span>
                        </a>
                    </li>
                    
                </ul>
            </nav>
            
            <!-- Logout Button -->
            <div class="p-4 border-t border-gray-200">
                <a href="LogoutServlet" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-red-600 hover:bg-red-50 transition">
                    <i data-lucide="log-out" class="w-5 h-5"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        
        <!-- Main Content Area -->
        <div class="flex-1 flex flex-col overflow-hidden">
            
            <!-- Top Navbar -->
            <header class="bg-white shadow-sm border-b border-gray-200">
                <div class="flex items-center justify-between px-8 py-4">
                    <div class="flex items-center space-x-6">
                        
                        <nav class="hidden md:flex items-center space-x-6">
<!--                            <a href="userDashboard.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                            <a href="#" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Search Medicine</a>
                            <a href="registerPharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Register Pharmacy</a>
                            <a href="UserManagePharmacy.jsp" class="text-sm font-medium text-blue-600">My Pharmacy</a>-->
                            <h2 class="text-xl font-bold text-gray-800 mb-4">Welcome, <%= pharmacyName %></h2>
                        </nav>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <!-- Profile & Logout -->
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-black rounded-full flex items-center justify-center">
                                <i data-lucide="user" class="text-white w-5 h-5"></i>
                            </div>
                            <div class="text-right hidden sm:block">
                                <p class="text-sm font-medium text-gray-800"><%=name%></p>
                                <p class="text-xs text-gray-500"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
                                
                                
            <main class="flex-1 overflow-y-auto p-8">
            <div class="mb-8">
                    <h2 class="text-xl font-bold text-gray-800 mb-4">Current Stock</h2>
                    <div class="bg-white rounded-xl shadow-sm border border-gray-100">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50 border-b border-gray-200">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Medicine Name</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Mfc. Company</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Description</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Quantity</th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase">Action</th>
                                    </tr>
                                </thead>
                                
                                <%
                                    List<Stock> medicineStock = StockDAO.getStock(pharmacy_id);
                                    
                                    for(Stock s : medicineStock)
                                    {   
                                        
                                        
                                %>
                                
                                <tbody class="divide-y divide-gray-200">
                                    <tr>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center space-x-3">
                                                <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
                                                    <i data-lucide="pill" class="text-green-600 w-5 h-5"></i>
                                                </div>
                                                <div>
                                                    <p class="text-sm font-medium text-gray-800"><%= s.getMedicineName() %></p>
                                                    <p class="text-xs text-gray-500">Open 24/7</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= s.getCompany() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= s.getDescription() %></td>
                                        <td class="px-6 py-4 text-sm text-gray-600"><%= s.getQuantity() %></td>
                                        <td class="px-6 py-4">
                                            <div class="flex space-x-2">
        
                                               <form action="updateStock.jsp" method="post">
                                                   
                                                   <input type="hidden" name="medicineName" value="<%= s.getMedicineName() %>" />
                                                   <input type="hidden" name="stockID" value="<%= s.getStockId() %>" />
                                                   
                                                   <button type="submit" class="px-4 py-2 bg-white text-blue-500 border-2 border-blue-500 text-xs rounded-lg hover:bg-blue-500 hover:text-white transition">Update Stock</button>
                                               </form>
                                               
                                               <form action="medicineStockRemoveServlet" method="post">
                                                   <input type="hidden" name="stockid" value="<%= s.getStockId() %>" />
                            
                                                   <button type="submit" class="px-4 py-2 bg-white text-red-500 border-2 border-red-500 text-xs rounded-lg hover:bg-red-500 hover:text-white transition">Delete Stock</button>
                                               </form>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>        
            </main>
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
</body>
</html>

