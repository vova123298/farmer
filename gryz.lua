local sampev = require("samp.events")
local telegramuvedi = true -- Для кого я это комментирую? 
require("addon")  -- Шизофреник ебаный
local napisal = true
local requests = require 'requests'
local buf = 0
local startbot
local azcount = 0
local lpass = 12
local vector3d = require('vector3d')
local referal = ('Sam_Mason')
servername = ('неизвестно') --не менять
local ss = require("samp-store")
promocodik = ('mason') --не менять
setAutoPick(true)
local token = ('6072446648:AAEstALRfqwpV-cXKDNJsYtwkRVCQH8NKMA') -- токен бота @botfather
local chatid = ('5905110684') -- чат айди @getmyid_bot
ss.InitApiKey("Токен пихай сюды")

local link = ('https://api.telegram.org/bot' .. token .. '/sendMessage?chat_id=' .. chatid .. '&text=')
botSpawn = 1
function altwait(timerw)
     newTask(function()
	     wait((timerw*1000))
		 fakealt()
	 end)
end


local headers = {['X-Api-Key'] = 'Zc28Wv18z5ZHDF9Q4wDKhA==6BAFtSm36MzOAKog'}
local generator = "https://api.api-ninjas.com/v1/passwordgenerator?length="..lpass.."&exclude_special_chars=true"
local response1 = requests.get(generator, {headers = headers})
local password = string.sub(response1.text, 22, 20 + lpass + 1);
print(response1.text)


function getpick()
    for k, v in pairs(getAllPickups()) do
	 print(v.position.x, v.position.y, v.position.z)
     if v.position.x > -87 and v.position.x < -85 then 
	 print("Ok")
	 sendPickedUpPickup(k) 
	 end
    end
end


function getpickout(lowx, higx)
    for k, v in pairs(getAllPickups()) do
	 print(v.position.x, v.position.y, v.position.z)
     if v.position.x > lowx and v.position.x < higx then 
	 print("Ok")
	 sendPickedUpPickup(k) 
	 end
    end
end

function zavodoutw()
    newTask(function()
        setAutoPick(false)
        runRoute("!play zavodout")
	    wait((10000))
	    getpickout(2575, 2578)
	    wait((2000))
	    coordStart(629.66, -572.06, 16.52, 100, 2.0, true)
		wait((60*1000))
		getpickout(626, 628)
		wait((3000))
		coordStart(1514, 1354, 17.50, 100, 2.0, true)
		print("Качаемся в RCPD")
	end)
end

function sampev.onServerMessage(color, text)
	if text:match('Отправляйтесь к разгрузке вагонов') then 
	    runRoute("!play peregototrum")
	end		
	if text:match('+3.0 HP') then 
	    print("Болька")
	end	
	if text:find("Пока вы малоимущий") then
	    onserver()
	end
    if text:find('Груза перетащено: {......}%d+') then
        rabgryzila = tonumber(text:match('Груза перетащено: {......}(%d+)'))
		if rabgryzila >= 30 then
		runRoute("!play gopereod")
		altwait(15)
		end
    end   
	if text:find('Вы уже изготовили: {......}%d+') then
        rabzavod = tonumber(text:match('Вы уже изготовили: {......}(%d+)'))
		if rabzavod >= 30 then
		    zavodoutw()
		elseif rabzavod < 30 then
		    runRoute("!play zavodtakeitem2")
		end
    end  
 	if text:find('+1 AZ Coins.%d+') then
        azcount = text:match('+1 AZ Coins.(%d+)')
		inventclo()
    end
	if text:find("Вам был добавлен предмет 'Ускоренная прокачка") then
	    sendInput("/invent")
	end
end

function sampev.onShowTextDraw(id, data)
 if id == 420 then
    newTask(function()
  wait(1000)
  sendClickTextdraw(419)
  sendClickTextdraw(521)
    end)
 end
 if id == 554 then
  sendClickTextdraw(554)
  gryzilarand()
 end
  if data.text:find("+3.0 HP") then
  generatenick()
  end
  if id == 528 then
  sendClickTextdraw(528)
  gryzilarand()
 end
 
   if id == 551 then
  sendClickTextdraw(551)
  gryzilarand()
 end
 
 if id == 510 or id == 511 then
     zavodfunc(510, 511)
 end
 
  if id == 532 or id == 533 then
     zavodfunc(532, 533)
 end
 
 if data.modelId == 1274 then
  azid = id
  giveaz()
 end
    if data.modelId == 1919 then
	   getitem = id
	   giveitem()
	end
end
local azcountnumb = 0
function inventclo()
    azcountnumb = azcountnumb + tonumber(azcount)
    if azcountnumb >= 28 then
	sendInput("/invent")
	end
end
function giveitem()
		 buf = 1
	     wait((2*1000))
		 sendClickTextdraw(getitem)
		 wait(3000)
		 sendClickTextdraw(2302)
		 wait((1000))
		 sendClickTextdraw(2111)
		 buf = 0
end
function giveaz()
     newTask(function()
		if	buf == 0 then
		 buf = 1
	     wait((2*1000))
		 sendClickTextdraw(azid)
		 wait((3000))
		 sendClickTextdraw(2302)
		 wait((3000))
		 sendClickTextdraw(2111)
		 end
	 end)
end
function zavodfunc(one, two)
    newTask(function()
	 wait((250))
	 sendClickTextdraw(one)
	 wait((500))
	 sendClickTextdraw(two)
	 wait((2000))
     runRoute("!play 123456")
	 wait((10000))
	 fakealt()
	 wait((1000))
	 fakealt()
	 wait((1000))
	 fakealt()
	 fakealt()
	 wait((9000))
	 runRoute("!play zavodgiveitem")
	 wait((5000))
	 fakealt()
	 wait((2000))
	 fakealt()
	 fakealt()
	 end)
end
function coordzavod()
    newTask(function()
	wait((3000))
	coordStart(1944.98, -1482.56, 10.8281, 100, 2.0, true)
	wait((15000))
	coordStart(-87.37, -300.9, 2.76, 100, 2.0, true)
	wait((150*1000))
	setAutoPick(false)
	getpick()
    wait((4000))
	runRoute("!play pereodzavod")
	wait((4000))
	setAutoPick(true)
	altwait(10)
	end)
end

function zavodgive()
    newTask(function()
    wait((10*1000))
	runRoute("!play zavodgiveitem")
	altwait(5)
    end)
end
-- Чек слапа низ
function sampev.onSetPosition(x,y,z)
    local xx, yy, zz = getBotPosition()
    if (x == xx and y == yy and z ~= zz) then print("слап") end
end

local slap = {
	spawn_pos = vector3d(0.0, 0.0, 0.0),
}
function sampev.onSetSpawnInfo(team, skin, _, pos, rotation, weapons, ammo)
	slap.spawn_pos = vector3d(pos.x, pos.y, pos.z)
end

function sampev.onShowDialog(id, style, title, btn1, btn2, text)
    if title:find('Пароль') then
        sendDialogResponse(id, 1, 0, password)
        return false
    end
    if title:find('Авторизация') then
        sendDialogResponse(id, 1, 0, password)
        return false
    end
    if title:find('Выберите ваш пол') then
  sendDialogResponse(id, 1, 0, "")
        return false
    end
 if title:find('Выберите цвет кожи') then
  sendDialogResponse(id, 1, 0, "")
        return false
    end
 if title:find('вы о нас узнали?') then
  sendDialogResponse(id, 1, 1, "")
        return false
 end
 if title:find('Введите ник пригласившего?') then
  sendDialogResponse(id, 1, 0, referal)
        return false
 end
 if title:find('Дополнительная') then
  sendDialogResponse(id, 0, 0, "")
  return false
 end
    if text:find('Вы собираетесь устроиться') then
        sendDialogResponse(id, 1, 0, "")
		runRoute("!play pereodevalkagryz")
		altwait(3)
        return false
    end
	
    if text:find('ответил вам:') then
        sendDialogResponse(id, 1, 0, "")
		runRoute("stop")
        autoot()
        return false
    end
	
	if text:find("Вы хотите переодеться чтобы начать работу?") then
        sendDialogResponse(id, 1, 0, "")
        return false
    end
		if text:find("Вы успешно обменяли") then
        return false
    end
		if text:find("Вы хотите переодеться и начать работать?") then
        sendDialogResponse(id, 1, 0, "")
		runRoute("!play zavodtakeitem")
        return false
    end
	if title:find("Акции на Arizona") then
        return false
    end
	if title:find("Акции на") then
        return false
    end
	
	if text:find("которое хотите использовать") then
        sendDialogResponse(id, 1, 0, tostring(azcountnumb))
		buf = 0
		waitdon()
        return false
    end	
	if text:find("Вы получили бан аккаунта") then
        sendDialogResponse(id, 1, 0, "")
		generatenick()
        return false
    end
		if text:find("Вы хотите переодеться чтобы завершить работу?") then
        sendDialogResponse(id, 1, 0, "")
		coordzavod()
        return false
    end
	if title:find('Информация') then
        sendDialogResponse(id, 1, 0, "")
        return false
    end
	if title:find('Этот аккаунт заблокирован!') then
	    print("Бан нахуй")
		sendDialogResponse(id, 1, 0, "")
        generatenick()
        return false
    end
	
	if title:find('Платные услуги') then
        sendDialogResponse(id, 1, 0, "")
        return false
    end
	
	if id == 26189 then
        sendDialogResponse(id, 1, 5, "")
        return false
    end
    if id == 900 then
        sendDialogResponse(id, 1, 0, tostring(azcountnumb))
        return false
    end
    if id == 26190 then
        sendDialogResponse(id, 1, 0, '')
        return false
    end
	if text:find("Подсказка") then
	 sendDialogResponse(id, 1, 0, "")
	return false
	end
end
function waitdon()
        newTask(function()
		 wait((1000))
		 sendInput("/donate")
	 end)
end

	local vityt = {
    "превет да тут";
    "тут я";
    "да";
    "ку да тут";
	"я тут";
}

function autoot()
     newTask(function()
	 wait(4000)
	 math.randomseed(os.time())
     sendInput(vityt[math.random(#vityt)])
	 reconnect()
	 buf = 1
	 end)
end
function sozdatlog(text) -- Типа тута оно кидает вон то туда и все отлично
	local f = io.open(getPath().."\\scripts\\gryzila.txt", "a")
	f:write(text)
	f:close()
end

function onReceivePacket(id, bs)
    if id == 36 then
        exit()
        return false
    end
end

function onLoad()
	print("[Грузчики] *приехали*")
	print("[Бригадир] РАБОТАТЬ СУКА!!!")
	newTask(function()
		while true do
			wait(10000)
			local score = getBotScore()
			if getBotScore() >= 3 and napisal == true then
				sozdatlog(getBotNick()..':'..password.." "..getBotMoney().." "..servername.."\n")
				local upload_res = ss.UploadAccount(serverip, 5, getBotNick(), password, "Аккаунт под основу", "Прокаченый аккаунт под основу", _)
				print("акк сохранен")
				if upload_res then
					asyncHttpRequest('GET', AnsiToUtf8(link.."[Успешный аккаунт]%0A%0A".."Ник: "..getBotNick().."%0AСервер: "..servername), nil, nil, nil)
				else
					print("у вас выключены телеграм уведомления")
				end
				generatenick()
				napisal = false
			end
		end
	end)
end
	local marshrut = {
    "botgryzila";
    "botgryzila2";
    "botgryzila3";
    "botgryzila4";
	"botgryzila5";
}
function gryzilarand()
    math.randomseed(os.time())
    runRoute("!play "..marshrut[math.random(#marshrut)])
	print("Выше рандом")
end
function onserver()
        newTask(function()
    		 if getBotInterior() == 0 and botSpawn == 1 then
		        botSpawn = 0
				wait((5*1000))
				botSpawn = 1
				print(getAllPickups())
			    print("[Рабочий] Опять работать?")
			    runRoute("!play fromspawngryz")
		        wait((50*1000))	
			    fakealt()
    		 end
	    end)
end
	
	
registerHandler("onDisconnect", function()
	task:kill()
end)

	
	
	
	
	
	
	
	
	function onConnect()
	serverip = getServerAddress()
	if serverip == '185.169.134.3:7777' then
		servername = ('Phoenix')
		promocodik = ('babetape')
	end
	if serverip == '185.169.134.4:7777' then
		servername = ('Tucson')
		promocodik = ('берлога')
	end
	if serverip == '185.169.134.43:7777' then
		servername = ('Scottdale')
		promocodik = ('steve')
	end
	if serverip == '185.169.134.44:7777' then
		servername = ('Chandler')
		promocodik = ('richilox')
	end
	if serverip == '185.169.134.45:7777' then
		servername = ('Brainburg')
		promocodik = ('bobylew')
	end
	if serverip == '185.169.134.5:7777' then
		servername = ('Saint-rose')
		promocodik = ('dante')
	end
	if serverip == '185.169.134.59:7777' then
		servername = ('Mesa')
		promocodik = ('first')
	end
	if serverip == '185.169.134.61:7777' then
		servername = ('Red-rock')
		promocodik = ('bratok')
	end
	if serverip == '185.169.134.107:7777' then
		servername = ('Yuma')
		promocodik = ('waldemar')
	end
	if serverip == '185.169.134.109:7777' then
		servername = ('Surprise')
		promocodik = ('ettore')
	end
	if serverip == '185.169.134.166:7777' then
		servername = ('Prescott')
		promocodik = ('aher7777')
	end
	if serverip == '185.169.134.171:7777' then
		servername = ('Glendale')
		promocodik = ('РИНЖИ')
	end
	if serverip == '185.169.134.172:7777' then
		servername = ('Kingman')
		promocodik = ('aher')
	end
	if serverip == '185.169.134.173:7777' then
		servername = ('Winslow')
		promocodik = ('shakur')
	end
	if serverip == '185.169.134.174:7777' then
		servername = ('Payson')
		promocodik = ('feldan')
	end
	if serverip == '80.66.82.191:7777' then
		servername = ('Gilbert')
		promocodik = ('babetape')
	end
	if serverip == '80.66.82.190:7777' then
		servername = ('Showlow')
		promocodik = ('money')
	end
	if serverip == '80.66.82.188:7777' then
		servername = ('Casa-grande')
		promocodik = ('rocky')
	end
	if serverip == '80.66.82.168:7777' then
		servername = ('Page')
		promocodik = ('denkazor')
	end
	if serverip == '80.66.82.159:7777' then
		servername = ('Sun-city')
		promocodik = ('romadit')
	end
	if serverip == '80.66.82.200:7777' then
		servername = ('Queen-creek')
		promocodik = ('mason')
	end
	if serverip == '80.66.82.144:7777' then
		servername = ('Sedona')
		promocodik = ('mason')
	end
	if serverip == '80.66.82.162:5125' then
		servername = ('Mobile I')
		promocodik = ('mason')
	end
	if serverip == '80.66.82.148:5125' then
		servername = ('Mobile II')
		promocodik = ('mason')
	end
	if serverip == '80.66.82.136:5125' then
		servername = ('Mobile III')
		promocodik = ('mason')
	end
	print("вы зашли на сервер "..servername)
end
	
	
	
	
	
	
	
	
	
	-- Хуйня ебаная внизу
	
	local effil = require 'effil'

function asyncHttpRequest(method, url, args, resolve, reject)
   local request_thread = effil.thread(function (method, url, args)
      local result, response = pcall(requests.request, method, url, args)
      if result then
         response.json, response.xml = nil, nil
         return true, response
      else
         return false, response
      end
   end)(method, url, args)
   if not resolve then resolve = function() end end
   if not reject then reject = function() end end
   newTask(function()
      local runner = request_thread
      while true do
         local status, err = runner:status()
         if not err then
            if status == 'completed' then
               local result, response = runner:get()
               if result then
                  resolve(response)
               else
                  reject(response)
               end
               return
            elseif status == 'canceled' then
               return reject(status)
            end
         else
            return reject(err)
         end
         wait(0)
      end
   end)
end

local ansi_decode={
	 [128]='\208\130',[129]='\208\131',[130]='\226\128\154',[131]='\209\147',[132]='\226\128\158',[133]='\226\128\166',
	 [134]='\226\128\160',[135]='\226\128\161',[136]='\226\130\172',[137]='\226\128\176',[138]='\208\137',[139]='\226\128\185',
	 [140]='\208\138',[141]='\208\140',[142]='\208\139',[143]='\208\143',[144]='\209\146',[145]='\226\128\152',
	 [146]='\226\128\153',[147]='\226\128\156',[148]='\226\128\157',[149]='\226\128\162',[150]='\226\128\147',[151]='\226\128\148',
	 [152]='\194\152',[153]='\226\132\162',[154]='\209\153',[155]='\226\128\186',[156]='\209\154',[157]='\209\156',
	 [158]='\209\155',[159]='\209\159',[160]='\194\160',[161]='\209\142',[162]='\209\158',[163]='\208\136',
	 [164]='\194\164',[165]='\210\144',[166]='\194\166',[167]='\194\167',[168]='\208\129',[169]='\194\169',
	 [170]='\208\132',[171]='\194\171',[172]='\194\172',[173]='\194\173',[174]='\194\174',[175]='\208\135',
	 [176]='\194\176',[177]='\194\177',[178]='\208\134',[179]='\209\150',[180]='\210\145',[181]='\194\181',
	 [182]='\194\182',[183]='\194\183',[184]='\209\145',[185]='\226\132\150',[186]='\209\148',[187]='\194\187',
	 [188]='\209\152',[189]='\208\133',[190]='\209\149',[191]='\209\151'
}

function AnsiToUtf8(s)
	 local r, b = ''
	 for i = 1, s and s:len() or 0 do
	   b = s:byte(i)
	   if b < 128 then
	     r = r..string.char(b)
	   else
      if b > 239 then
	       r = r..'\209'..string.char(b - 112)
	     elseif b > 191 then
	       r = r..'\208'..string.char(b - 48)
	     elseif ansi_decode[b] then
	       r = r..ansi_decode[b]
	     else
	       r = r..'_'
	     end
	   end
	 end
  return r
end
-- Хуйня ебаная вверху






function fakealt()
local x, y, z = getBotPosition()
local qw, qx, qy, qz = getBotQuaternion()
local bs = bitStream.new()
bs:writeUInt8(207)
bs:writeUInt16(0)
bs:writeUInt16(0)
bs:writeUInt16(1024)
bs:writeFloat(x)
bs:writeFloat(y)
bs:writeFloat(z)
bs:writeFloat(qw)
bs:writeFloat(qx)
bs:writeFloat(qy)
bs:writeFloat(qz)
bs:writeUInt8(getBotHealth())
bs:writeUInt8(getBotArmor())
bs:writeUInt8(0)
bs:writeUInt8(0)
bs:writeFloat(0)
bs:writeFloat(0)
bs:writeFloat(0)
bs:writeFloat(0)
bs:writeFloat(0)
bs:writeFloat(0)
bs:writeUInt16(0)
bs:writeInt16(1195)
bs:writeInt16(32776)
bs:sendPacket()
bs:reset()
end



local rep = false
local loop = false
local packet, veh = {}, {}
local counter = 0

local bitstream = {
	onfoot = bitStream.new(),
	incar = bitStream.new(),
	aim = bitStream.new()
}

function onRunCommand(cmd)
	if cmd:find('generate') then
	generatenick()
	end
end
function generatenick()
		name,fam = '',''
		math.randomseed(os.time()^3.14)
		for k = math.random(4,10),1,-1 do
			name = name..string.char(math.random(97, 122))
		end
		for k = math.random(3,10),1,-1 do
			fam = fam..string.char(math.random(97, 122))
		end
		nick = string.gsub(name, "%l?", string.upper, 1)..'_'..string.gsub(fam, "%l?", string.upper, 1)
		setBotNick(nick)
		reconnect(1000)
		napisal = true
		botSpawn = 1
		azcountnumb = 0
end


function onRunCommand(cmd)
	if cmd:find('!play') or cmd:find('!stop') or cmd:find('!loop') then
		runRoute(cmd)
		return false
	end
	if cmd:find('!zavod') then
	    runRoute("!stop")
		coordzavod()
		return false
	end
end

function sampev.onSendVehicleSync(data)
	if rep then return false end
end

function sampev.onSendPlayerSync(data)
	if rep then return false end
end

function sampev.onVehicleStreamIn(vehid, data)
	veh[vehid] = data.health
end


function check_update()
	if rep then
		local ok = fillBitStream(getBotVehicle() ~= 0 and 2 or 1) 
		if ok then
			if getBotVehicle() ~= 0 then bitstream.incar:sendPacket() else bitstream.onfoot:sendPacket() end
			setBotPosition(packet[counter].x, packet[counter].y, packet[counter].z)
			counter = counter + 1
			if counter%20 == 0 then
				local aok = fillBitStream(3)
				if aok then 
					bitstream.aim:sendPacket()
				else 
					err()
				end
			end
		else
			err()
		end
					
		bitstream.onfoot:reset()
		bitstream.incar:reset()
		bitstream.aim:reset()
					
		if counter == #packet then
			if not loop then
				rep = false
				setBotPosition(packet[counter].x, packet[counter].y, packet[counter].z)
				setBotQuaternion(packet[counter].qw, packet[counter].qx, packet[counter].qy, packet[counter].qz)
				print('route end. stoping!')
				packet = {}
			end
			counter = 1
		end
	end
end

newTask(function()
	while true do
		check_update()
		wait(50)
	end
end)

local print = function(arg) return print('[Route Player]: '..arg) end

function err()
	rep = false
	packet = {}
	counter = 1
	print('an error has occured while writing data')
end

function fillBitStream(mode)
	if mode == 2 then
		local bs = bitstream.incar
		bs:writeUInt8(packet[counter].packetId)
		bs:writeUInt16(getBotVehicle())
		bs:writeUInt16(packet[counter].lr)
		bs:writeUInt16(packet[counter].ud)
		bs:writeUInt16(packet[counter].keys)
		bs:writeFloat(packet[counter].qw)
		bs:writeFloat(packet[counter].qx)
		bs:writeFloat(packet[counter].qy)
		bs:writeFloat(packet[counter].qz)
		bs:writeFloat(packet[counter].x)
		bs:writeFloat(packet[counter].y)
		bs:writeFloat(packet[counter].z)
		bs:writeFloat(packet[counter].sx)
		bs:writeFloat(packet[counter].sy)
		bs:writeFloat(packet[counter].sz)
		bs:writeFloat(veh[getBotVehicle()])
		bs:writeUInt8(getBotHealth())
		bs:writeUInt8(getBotArmor())
		bs:writeUInt8(0)
		bs:writeUInt8(0)
		bs:writeUInt8(packet[counter].gear)
		bs:writeUInt16(0)
		bs:writeFloat(0)
		bs:writeFloat(0)
		
	elseif mode == 1 then		
		local bs = bitstream.onfoot
		bs:writeUInt8(packet[counter].packetId)
		bs:writeUInt16(packet[counter].lr)
		bs:writeUInt16(packet[counter].ud)
		bs:writeUInt16(packet[counter].keys)
		bs:writeFloat(packet[counter].x)
		bs:writeFloat(packet[counter].y)
		bs:writeFloat(packet[counter].z)
		bs:writeFloat(packet[counter].qw)
		bs:writeFloat(packet[counter].qx)
		bs:writeFloat(packet[counter].qy)
		bs:writeFloat(packet[counter].qz)
		bs:writeUInt8(getBotHealth())
		bs:writeUInt8(getBotArmor())
		bs:writeUInt8(0)
		bs:writeUInt8(packet[counter].sa)
		bs:writeFloat(packet[counter].sx)
		bs:writeFloat(packet[counter].sy)
		bs:writeFloat(packet[counter].sz)
		bs:writeFloat(0)
		bs:writeFloat(0)
		bs:writeFloat(0)
		bs:writeUInt16(0)
		bs:writeUInt16(packet[counter].anim)
		bs:writeUInt16(packet[counter].flags)
		
	elseif mode == 3 then
		local bs = bitstream.aim
		bs:writeUInt8(203)
		bs:writeUInt8(packet[counter].mode)
		bs:writeFloat(packet[counter].cx)
		bs:writeFloat(packet[counter].cy)
		bs:writeFloat(packet[counter].cz)
		bs:writeFloat(packet[counter].px)
		bs:writeFloat(packet[counter].py)
		bs:writeFloat(packet[counter].pz)
		bs:writeFloat(packet[counter].az)
		bs:writeUInt8(packet[counter].zoom)
		bs:writeUInt8(packet[counter].wstate)
		bs:writeUInt8(packet[counter].unk)
		
	else return false end
	return true
end

function runRoute(act)
	if act:find('!play .*') then
		packet = loadIni(getPath()..'routes\\'..act:match('!play (.*)')..'.rt')
		if packet then
			print('playing route "'..act:match('!play (.*)')..'". total length: '..#packet)
			counter = 1
			rep = true
			loop = false
		else
			print('route doesnt exist')
		end
	elseif act:find('!loop') then
		if rep then loop = not loop; print(loop and 'looping current route' or 'loop off') else print('not playing any route') end
	elseif act:find('!stop') then
		if counter > 1 then rep = not rep else print('not playing any route') end
		if not rep then setBotQuaternion(packet[counter].qw, packet[counter].qx, packet[counter].qy, packet[counter].qz) end
		print(rep and 'playing resumed' or 'stopped on packet: '.. counter)
	end
end

function loadIni(fileName)
	local file = io.open(fileName, 'r')
	if file then
		local data = {}
		local section
		for line in file:lines() do
			local tempSection = line:match('^%[([^%[%]]+)%]$')
			if tempSection then
				section = tonumber(tempSection) and tonumber(tempSection) or tempSection
				data[section] = data[section] or {}
			end
			local param, value = line:match('^([%w|_]+)%s-=%s-(.+)$')
			if param and value ~= nil then
				if tonumber(value) then
					value = tonumber(value)
				elseif value == 'true' then
					value = true
				elseif value == 'false' then
					value = false
				end
				if tonumber(param) then
					param = tonumber(param)
				end
				data[section][param] = value
			end
		end
		file:close()
		return data
	end
	return false
end

generatenick()