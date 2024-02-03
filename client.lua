RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	local data = xPlayer
	local accounts = data.accounts
	for k,v in pairs(accounts) do
		local account = v
		if account.name == "bank" then
			SendNUIMessage({action = "setValue", value = ""..account.money, key = "bankmoney"})
		elseif account.name == "black_money" then
			SendNUIMessage({action = "setValue", value = ""..math.floor(account.money), key = "dirtymoney"})
		elseif account.name == "black_money" then
			SendNUIMessage({action = "setValue", value = ""..math.floor(account.money), key = "money"})
		end
	end

	-- Job
	local job = data.job
	SendNUIMessage({action = "setValue", key = "job", value = job.label.." - "..job.grade_label, icon = job.name})

	-- Money
	SendNUIMessage({action = "setValue", value = ""..data.money, key = "money"})
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	if account.name == "bank" then
		SendNUIMessage({action = "setValue", value = ""..account.money, key = "bankmoney"})
	elseif account.name == "black_money" then
		SendNUIMessage({action = "setValue", value = ""..math.floor(account.money), key = "dirtymoney"})
	elseif account.name == "money" then
		SendNUIMessage({action = "setValue", value = ""..math.floor(account.money), key = "money"})
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  SendNUIMessage({action = "setValue", value = job.label.." - "..job.grade_label, icon = job.name, key = "job"})
end)
