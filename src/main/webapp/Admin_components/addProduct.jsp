<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Product</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Admin_components/addProdcutcss.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <!-- Main content -->
    <div class="main-content">
        
    <div class="dashboard-container">
    <div class="content-header">
        <h1>Add New Product</h1>
       </div>
        <form action="${pageContext.request.contextPath}/addProduct" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Category</label>
                <select name="category" id="category" onchange="showSpecifications()" required>
                    <option value="">Select Category</option>
                    <option value="mobile">Mobile Phone</option>
                    <option value="pc">PC/Laptop</option>
                    <option value="watch">Smart Watch</option>
                    <option value="headset">Headset</option>
                    <option value="tv">TV</option>
                </select>
            </div>

            <div class="form-group">
                <label>Product Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Company</label>
                <input type="text" name="company" required>
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number" name="price" step="0.01" required>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label>Product Image</label>
                <input type="file" name="image" accept="image/*" required>
            </div>

            <!-- Mobile Phone Specifications -->
            <div id="mobileSpecs" class="specs-container" style="display: none;">
                <h3>Mobile Phone Specifications</h3>
                <div class="form-group">
                    <label>Brand</label>
                    <input type="text" name="mobile_brand">
                </div>
                <div class="form-group">
                    <label>Operating System</label>
                    <input type="text" name="mobile_os">
                </div>
                <div class="form-group">
                    <label>RAM (GB)</label>
                    <input type="text" name="mobile_ram">
                </div>
                <div class="form-group">
                    <label>Storage (GB)</label>
                    <input type="text" name="mobile_storage">
                </div>
                <div class="form-group">
                    <label>Main Camera (MP)</label>
                    <input type="text" name="mobile_main_camera">
                </div>
                <div class="form-group">
                    <label>Rear Camera (MP)</label>
                    <input type="text" name="mobile_rear_camera">
                </div>
                <div class="form-group">
                    <label>Network Technology</label>
                    <input type="text" name="mobile_network">
                </div>
                <div class="form-group">
                    <label>Screen Technology</label>
                    <input type="text" name="mobile_screen">
                </div>
                <div class="form-group">
                    <label>Weight (g)</label>
                    <input type="text" name="mobile_weight">
                </div>
                <div class="form-group">
                    <label>Launch Date</label>
                    <input type="date" name="mobile_launch_date">
                </div>
                <div class="form-group">
                    <label>Battery Capacity (mAh)</label>
                    <input type="text" name="mobile_battery">
                </div>
                <div class="form-group">
                    <label>Charging Specifications</label>
                    <input type="text" name="mobile_charging">
                </div>
            </div>

            <!-- PC/Laptop Specifications -->
            <div id="pcSpecs" class="specs-container" style="display: none;">
                <h3>PC/Laptop Specifications</h3>
                <div class="form-group">
                    <label>Brand</label>
                    <input type="text" name="pc_brand">
                </div>
                <div class="form-group">
                    <label>Processor Speed</label>
                    <input type="text" name="pc_processor">
                </div>
                <div class="form-group">
                    <label>RAM (GB)</label>
                    <input type="text" name="pc_ram">
                </div>
                <div class="form-group">
                    <label>Storage (GB)</label>
                    <input type="text" name="pc_storage">
                </div>
                <div class="form-group">
                    <label>Display Size (inches)</label>
                    <input type="text" name="pc_display">
                </div>
                <div class="form-group">
                    <label>Graphics Card</label>
                    <input type="text" name="pc_graphics">
                </div>
                <div class="form-group">
                    <label>Operating System</label>
                    <input type="text" name="pc_os">
                </div>
                <div class="form-group">
                    <label>Battery Capacity (Wh)</label>
                    <input type="text" name="pc_battery">
                </div>
                <div class="form-group">
                    <label>Charging Specifications</label>
                    <input type="text" name="pc_charging">
                </div>
                <div class="form-group">
                    <label>Touch Sensor</label>
                    <select name="pc_touch">
                        <option value="false">No</option>
                        <option value="true">Yes</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Keyboard Backlight</label>
                    <select name="pc_keyboard_light">
                        <option value="false">No</option>
                        <option value="true">Yes</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Number of Fans</label>
                    <input type="number" name="pc_fans" min="0">
                </div>
            </div>
            
            <!-- Smart Watch Specifications -->
            <div id="watchSpecs" class="specs-container" style="display: none;">
                <h3>Smart Watch Specifications</h3>
                <div class="form-group">
                    <label>Model</label>
                    <input type="text" name="watch_model">
                </div>
                <div class="form-group">
                    <label>Storage</label>
                    <input type="text" name="watch_storage">
                </div>
                <div class="form-group">
                    <label>RAM</label>
                    <input type="text" name="watch_ram">
                </div>
                <div class="form-group">
                    <label>Rear Camera</label>
                    <input type="text" name="watch_rear_camera">
                </div>
                <div class="form-group">
                    <label>Front Camera</label>
                    <input type="text" name="watch_front_camera">
                </div>
                <div class="form-group">
                    <label>Battery Capacity</label>
                    <input type="text" name="watch_battery">
                </div>
                <div class="form-group">
                    <label>Charging Specifications</label>
                    <input type="text" name="watch_charging">
                </div>
                <div class="form-group">
                    <label>Connectivity</label>
                    <input type="text" name="watch_connectivity">
                </div>
                <div class="form-group">
                    <label>Display Size</label>
                    <input type="text" name="watch_display">
                </div>
                <div class="form-group">
                    <label>Water Proof Rating</label>
                    <input type="text" name="watch_waterproof">
                </div>
            </div>

            <!-- Headset Specifications -->
            <div id="headsetSpecs" class="specs-container" style="display: none;">
                <h3>Headset Specifications</h3>
                <div class="form-group">
                    <label>Brand</label>
                    <input type="text" name="headset_brand">
                </div>
                <div class="form-group">
                    <label>Battery Capacity</label>
                    <input type="text" name="headset_battery">
                </div>
                <div class="form-group">
                    <label>Charging Specifications</label>
                    <input type="text" name="headset_charging">
                </div>
                <div class="form-group">
                    <label>Wireless Technology</label>
                    <input type="text" name="headset_wireless">
                </div>
                <div class="form-group">
                    <label>Noise Cancellation</label>
                    <select name="headset_noise_cancellation">
                        <option value="false">No</option>
                        <option value="true">Yes</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Color</label>
                    <input type="text" name="headset_color">
                </div>
            </div>

            <!-- TV Specifications -->
            <div id="tvSpecs" class="specs-container" style="display: none;">
                <h3>TV Specifications</h3>
                <div class="form-group">
                    <label>Model</label>
                    <input type="text" name="tv_model">
                </div>
                <div class="form-group">
                    <label>Screen Size</label>
                    <input type="text" name="tv_screen_size">
                </div>
                <div class="form-group">
                    <label>Screen Resolution</label>
                    <input type="text" name="tv_resolution">
                </div>
                <div class="form-group">
                    <label>Refresh Rate</label>
                    <input type="text" name="tv_refresh_rate">
                </div>
                <div class="form-group">
                    <label>Operating System</label>
                    <input type="text" name="tv_os">
                </div>
                <div class="form-group">
                    <label>Audio System</label>
                    <input type="text" name="tv_audio">
                </div>
                <div class="form-group">
                    <label>Backlight</label>
                    <input type="text" name="tv_backlight">
                </div>
                <div class="form-group">
                    <label>Number of Speakers</label>
                    <input type="number" name="tv_speakers" min="0">
                </div>
                <div class="form-group">
                    <label>WiFi Specifications</label>
                    <input type="text" name="tv_wifi">
                </div>
                <div class="form-group">
                    <label>Bluetooth Specifications</label>
                    <input type="text" name="tv_bluetooth">
                </div>
                <div class="form-group">
                    <label>USB Ports</label>
                    <input type="number" name="tv_usb" min="0">
                </div>
                <div class="form-group">
                    <label>HDMI Ports</label>
                    <input type="number" name="tv_hdmi" min="0">
                </div>
                <div class="form-group">
                    <label>Memory</label>
                    <input type="text" name="tv_memory">
                </div>
                <div class="form-group">
                    <label>Weight</label>
                    <input type="text" name="tv_weight">
                </div>
            </div>

            <button type="submit" class="button">Add Product</button>
        </form>
        </div>
    </div>
    


    <script>
    function showSpecifications() {
        const category = document.getElementById('category').value;

        // Hide all spec containers
        document.getElementById('mobileSpecs').classList.remove('show');
        document.getElementById('pcSpecs').classList.remove('show');
        document.getElementById('watchSpecs').classList.remove('show');
        document.getElementById('headsetSpecs').classList.remove('show');
        document.getElementById('tvSpecs').classList.remove('show');

        // Show the selected category's specs
        if (category) {
            document.getElementById(category + 'Specs').classList.add('show');
        }
    }
</script>


</body>
</html>
