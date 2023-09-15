# Vulnerable Lighttpd 1.4.56 Service Laboratory

This repository contains a laboratory environment for demonstrating and understanding the impact of security vulnerabilities in Lighttpd version 1.4.56. The lab setup includes a Docker container running Lighttpd 1.4.56, which is known to have certain vulnerabilities.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Exploiting Vulnerabilities](#exploiting-vulnerabilities)
- [Mitigation](#mitigation)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The purpose of this laboratory is to provide a controlled environment for testing and understanding the consequences of exploiting known security vulnerabilities in Lighttpd 1.4.56. This can help in learning about web server security and vulnerability management.

## Prerequisites

Before you can use this laboratory environment, you'll need the following:

1. **Docker**: Ensure you have Docker installed on your system. You can download and install Docker from [Docker's official website](https://www.docker.com/).

## Usage

Follow these steps to set up and use the laboratory environment:

1. Clone this repository to your local machine:

   ``` git clone https://github.com/agalvarado/DoS_Lab.git ```

2. Navigate to the project directory:
    ```cd DoS_Lab/Lab_Ofensivo/Lighttpd_1.4.56 ```

3. Build the Docker container for the vulnerable Lighttpd 1.4.56 service:
    ``` sudo docker build -t lighttpd . ```

4. Run the Docker container:
    ``` sudo docker run --privileged -d -p 80:80 lighttpd ```

5. Search the container ID
    ``` sudo docker ps ```

6. Service execution
    ``` docker exec -it <ID> /usr/local/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf ```

7. The vulnerable Lighttpd 1.4.56 service is now running and can be accessed on your local machine at http://127.0.0.1.

8. Exploit vulnerability
    ``` ./CVE-2022-30780-lighttpd-denial-of-service.py -u http://127.0.0.1:80 ```


## Exploiting Vulnerabilities
To simulate and explore vulnerabilities in Lighttpd 1.4.56, you can use various tools and techniques. Please exercise caution and ensure that you are operating within a controlled environment. This laboratory environment is intended for educational and testing purposes only.

## Mitigation
To secure your web server and mitigate vulnerabilities:

1. Update Lighttpd: Regularly update Lighttpd to the latest version to patch known vulnerabilities.

2. Web Application Firewall (WAF): Implement a WAF to filter and monitor HTTP requests for malicious activities.

3. Security Headers: Add security headers to your web server configuration to protect against common web vulnerabilities.

4. Regular Auditing: Conduct regular security audits and vulnerability assessments of your web applications and server configuration.

## Contributing
Contributions to this laboratory environment are welcome. If you discover improvements, have suggestions, or want to report issues, please open an issue or submit a pull request.

## License
This laboratory environment is provided under the MIT License.
