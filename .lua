loadstring([[
-- Lấy ra nhân vật của người chơi
local player = game.Players.LocalPlayer

-- Bảng ánh xạ tên công cụ vào tốc độ tấn công
local tools = {
    ["Cận chiến"] = 0.1,          -- Đặt tốc độ tấn công cho cận chiến
    ["Trái ác quỷ"] = 0.2,        -- Đặt tốc độ tấn công cho trái ác quỷ
    ["Kiếm"] = 0.3,               -- Đặt tốc độ tấn công cho kiếm
    ["Súng"] = 0.4                -- Đặt tốc độ tấn công cho súng
}

-- Hàm để cập nhật tốc độ tấn công của công cụ
local function updateAttackSpeed(toolName, newDeltaX)
    -- Tìm và lấy ra công cụ tương ứng từ nhân vật của người chơi
    local tool = player.Backpack:FindFirstChild(toolName) or player.Character:FindFirstChild(toolName)

    -- Kiểm tra xem công cụ có tồn tại không
    if tool then
        tool.DeltaX.Value = newDeltaX
        print("Đã cập nhật tốc độ tấn công của " .. toolName .. " thành " .. newDeltaX)
    else
        print("Không tìm thấy công cụ " .. toolName .. " trong Blox Fruits")
    end
end

-- Hiển thị radio button cho các công cụ và cho phép người chơi chọn
for toolName, attackSpeed in pairs(tools) do
    print(toolName .. " - Tốc độ tấn công: " .. attackSpeed)
end

print("Chọn công cụ muốn cập nhật tốc độ tấn công:")
local selectedTool = io.read()

-- Kiểm tra xem công cụ được chọn có tồn tại trong bảng không
if tools[selectedTool] then
    print("Nhập tốc độ tấn công mới cho " .. selectedTool .. ":")
    local newDeltaX = tonumber(io.read())  -- Chuyển đổi đầu vào thành số
    if newDeltaX then
        updateAttackSpeed(selectedTool, newDeltaX)
    else
        print("Đầu vào không hợp lệ. Vui lòng nhập một số.")
    end
else
    print("Công cụ không hợp lệ. Vui lòng chọn lại.")
end
]])()
