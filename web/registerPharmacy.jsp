<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>       
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - HealHub</title>
    
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
            
                User u = (User)session.getAttribute("userData");
        %>
    
    <!-- Main Container -->
    <div class="flex min-h-screen">
        
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
                        <a href="userDashboard.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="layout-dashboard" class="w-5 h-5"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="search" class="w-5 h-5"></i>
                            <span>Search Medicine</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="map-pin" class="w-5 h-5"></i>
                            <span>Nearby Pharmacies</span>
                        </a>
                    </li>
                    <li>
                        <a href="registerPharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg bg-blue-50 text-blue-600 font-medium">
                            <i data-lucide="store" class="w-5 h-5"></i>
                            <span>Register Pharmacy</span>
                        </a>
                    </li>
                    <li>
                        <a href="UserManagePharmacy.jsp" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="building-2" class="w-5 h-5"></i>
                            <span>My Pharmacy</span>
                        </a>
                    </li>
<!--                    <li>
                        <a href="#" class="flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-700 hover:bg-gray-50 transition">
                            <i data-lucide="user" class="w-5 h-5"></i>
                            <span>Profile</span>
                        </a>
                    </li>-->
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
        <div class="flex-1 flex flex-col overflow-y-auto">
            
            <!-- Top Navbar -->
            <header class="bg-white shadow-sm border-b border-gray-200">
                <div class="flex items-center justify-between px-8 py-4">
                    <div class="flex items-center space-x-6">
                        
                        <nav class="hidden md:flex items-center space-x-6">
                            <a href="userDashboard.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Dashboard</a>
                            <a href="#" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">Search Medicine</a>
                            <a href="registerPharmacy.jsp" class="text-sm font-medium text-blue-600">Register Pharmacy</a>
                            <a href="UserManagePharmacy.jsp" class="text-sm font-medium text-gray-600 hover:text-blue-600 transition">My Pharmacy</a>
                        </nav>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <!-- Profile & Logout -->
                        <div class="flex items-center space-x-3">
                            <div class="w-10 h-10 bg-black rounded-full flex items-center justify-center">
                                <i data-lucide="user" class="text-white w-5 h-5"></i>
                            </div>
                            <div class="text-right hidden sm:block">
                                <p class="text-sm font-medium text-gray-800"><%= u.getUsername() %></p>
                                <p class="text-xs text-gray-500"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            
            <!-- Main Dashboard Content -->
            
                    
      <main class="flex-grow flex items-center justify-center py-4 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-2xl shadow-xl border border-gray-100">
            <div class="text-center">
                <h2 class="mt-0 text-3xl font-extrabold text-gray-900 tracking-tight">
                    Register your Pharmacy
                </h2>
                
            </div>

            <form action="AddPharmacyServlet" method="post" class="mt-8 space-y-6" onsubmit="return validateForm()">
                <div class="rounded-md shadow-sm">
                    
                    <div class="relative mb-1">
                        
                        <input id="pname" name="pname" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Pharmacy Name">
                    </div>
                    
                    <div class="relative mb-1">
                        
                        <input id="oname" name="oname" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Owner Name">
                    </div>
                    
                    <div class="relative mb-1">
                        
                        <input id="address" name="address" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Address">
                    </div>
                    
                     <div class="relative mb-1">
                        
                        <input id="contact" name="contact" type="text" required class="appearance-none rounded-md relative block w-full px-10 py-3 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-teal-500 focus:border-teal-500 focus:z-10 sm:text-sm" placeholder="Contact Details">
                        <input type="hidden" name="email" id="hidden" value=<%=email%> >
                    </div>
                    
                    <div class="mt-4">
    <p class="text-sm font-medium text-gray-700 mb-2">Select Pharmacy Location</p>
    <div id="map" class="w-full h-40 rounded-lg border"></div>
</div>

<!-- Hidden fields for lat/lng -->
<input type="hidden" name="latitude" id="lat">
<input type="hidden" name="longitude" id="lng">
                </div>

                <div class="flex items-center">
                    <input id="terms" name="terms" type="checkbox" required class="h-4 w-4 text-teal-600 focus:ring-teal-500 border-gray-300 rounded">
                    <label for="terms" class="ml-2 block text-sm text-gray-900">
                        I agree to the <a href="#" class="text-teal-600 hover:text-teal-500">Terms and Conditions</a>
                    </label>
                </div>

                <button type="submit" class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-lg text-white bg-teal-600 hover:bg-teal-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-teal-500 transition-colors shadow-lg shadow-teal-100">
                    <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                        <i data-lucide="arrow-right" class="h-5 w-5 text-teal-500 group-hover:text-teal-400"></i>
                    </span>
                    <span id="submit-text">Register Pharmacy</span>
                </button>
            </form>
         
        </div>
            
        </div>
        
    </div>
    
    <!-- Initialize Lucide Icons -->
    <script>
        lucide.createIcons();
    </script>
    
    <!-- Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAljVBN_mgHo_R2eRBhvX4wcnScgsFUdTo"></script>

<script>
let map;
let marker;

function initMap() {

    let defaultLocation = { lat: 20.5937, lng: 78.9629 };

    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 5,
        center: defaultLocation
    });

    // Auto-detect user location
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            let userLocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            map.setCenter(userLocation);
            map.setZoom(15);
        });
    }

    // Click to select location
    map.addListener("click", function(event) {

        let lat = event.latLng.lat();
        let lng = event.latLng.lng();

        document.getElementById("lat").value = lat;
        document.getElementById("lng").value = lng;

        if (marker) {
            marker.setPosition(event.latLng);
        } else {
            marker = new google.maps.Marker({
                position: event.latLng,
                map: map
            });
        }
    });
}

// Validation
function validateForm() {
    let lat = document.getElementById("lat").value;

    if (lat === "") {
        alert("Please select location on map!");
        return false;
    }
    return true;
}

window.onload = initMap;
</script>
    
</body>
</html>
