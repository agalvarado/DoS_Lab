# Nginx with Authentication and Fail2ban Laboratory

This repository contains a laboratory environment for running Nginx with authentication and Fail2ban to demonstrate how Fail2ban can help protect your web server by blocking malicious users after repeated failed login attempts.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Testing Fail2ban](#testing-fail2ban)
- [Mitigation](#mitigation)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This laboratory environment is designed to showcase the integration of Nginx with authentication and Fail2ban. Nginx is configured to require authentication, and Fail2ban is set up to monitor Nginx logs and ban IP addresses that repeatedly fail to authenticate.

## Prerequisites

Before you can use this laboratory environment, you'll need the following:

1. **Docker**: Ensure you have Docker installed on your system. You can download and install Docker from [Docker's official website](https://www.docker.com/).

## Usage

Follow these steps to set up and use the laboratory environment:

1. Clone this repository to your local machine:

   ```git clone https://github.com/agalvarado/DoS_Lab.git ```

2. Navigate to the project directory:

    ```cd DoS_Lab/Lab_Defensivo/nginx+fail2ban```

3. Build the Docker container for Nginx with authentication and Fail2ban:

    ```sudo docker build -t lighttpd-fail2ban .```

4. Run the Docker container:

    ```sudo docker run --privileged -d -p 80:80 lighttpd-fail2ban```

5. Nginx is now running with authentication. You can access it on your local machine at http://127.0.0.1. Try logging in with incorrect credentials to trigger Fail2ban.

6. Docker conteiner ID
   ``` docker ps```

7. Service execution
    ``` docker exec -it lighttpd-fail2ban /usr/local/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf ```

8. The vulnerable Lighttpd 1.4.56 service is now running and can be accessed on your local machine at http://127.0.0.1.

    ``` ./CVE-2022-30780-lighttpd-denial-of-service.py -u http://172.17.0.2:80 ```
## Testing Fail2ban
To test Fail2ban's functionality:

1. Open a web browser and access http://127.0.0.1.

2. Enter incorrect authentication credentials multiple times.

3. After a certain number of failed attempts, Fail2ban should ban your IP address. Check the Fail2ban logs and Nginx logs to verify the ban.

4. To unban your IP address (for testing purposes), you can manually remove the ban using the Fail2ban command.

## Mitigation
Fail2ban can help protect your web server against brute-force attacks and repeated failed login attempts. To enhance security further:

1. Strong Passwords: Encourage users to set strong, unique passwords.

2. Regular Updates: Keep Nginx, Fail2ban, and your operating system up to date with the latest security patches.

3. Monitor Logs: Regularly review Nginx and Fail2ban logs for suspicious activity.

4. Custom Rules: Tailor Fail2ban rules to your specific environment and needs.

## Contributing
Contributions to this laboratory environment are welcome. If you discover improvements, have suggestions, or want to report issues, please open an issue or submit a pull request.

## License
This laboratory environment is provided under the MIT License.
