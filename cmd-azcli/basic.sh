
az [command] [subcommand] --help # Ajuda

az group create --name myResourceGroup --location eastus # criar grupo de recursos

az vm create --resource-group myResourceGroup --name myVM --image ubuntults # criar vm linux

az vm create --resource-group myResourceGroup --name myVM --image win2016datacenter # criar vm windows server

az vm start --resource-group myResourceGroup --name myVM # iniciar vm

az vm stop --resource-group myResourceGroup --name myVM # parar vm

az vm deallocate --resource-group myResourceGroup --name myVM # desalocar vm

az vm restart --resource-group myResourceGroup --name myVM # reiniciar vm

az vm redeploy --resource-group myResourceGroup --name myVM # reimplantar vm

az vm delete --resource-group myResourceGroup --name myVM # excluir vm

az vm list # listar vms

az vm show --resource-group myResourceGroup --name myVM # obter informações da vm