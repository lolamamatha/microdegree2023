import psutil

def get_server_details():
    details = {}

    # Get CPU information
    cpu_info = psutil.cpu_info()
    details['CPU'] = {
        'Model': cpu_info.current_freq,
        'Cores': psutil.cpu_count(logical=False),
        'Threads': psutil.cpu_count(logical=True)
    }

    # Get memory information
    mem_info = psutil.virtual_memory()
    details['Memory'] = {
        'Total': mem_info.total,
        'Available': mem_info.available,
        'Used': mem_info.used
    }

    # Get disk information
    disk_info = psutil.disk_usage('/')
    details['Disk'] = {
        'Total': disk_info.total,
        'Used': disk_info.used,
        'Free': disk_info.free
    }

    # Get network information
    net_info = psutil.net_if_addrs()
    details['Network'] = {}
    for interface, addresses in net_info.items():
        details['Network'][interface] = [addr.address for addr in addresses]

    return details

if __name__ == '__main__':
    server_details = get_server_details()
    for category, values in server_details.items():
        print(f'{category} Details:')
        for key, value in values.items():
            print(f'  {key}: {value}')
