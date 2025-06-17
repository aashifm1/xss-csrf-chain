# 🔐 XSS-CSRF Chaining Script

A bash-based security testing tool that uses [Dalfox](https://github.com/hahwul/dalfox) to detect reflected XSS vulnerabilities and attempts to chain them with CSRF.

---

## 🚀 Features

- Automates reflected XSS detection using `dalfox`
- Parses PoCs and attempts CSRF attacks
- Accepts custom session cookies for authenticated CSRF testing
- Easy to run with just a few parameters

---

## 🛠 Requirements

- `bash`
- [`dalfox`](https://github.com/hahwul/dalfox) (install via `go install github.com/hahwul/dalfox/v2@latest`)
- `curl`
- Optional: `jq` (for more advanced JSON parsing in future versions)

---

## 📦 Installation

```bash
git clone https://github.com/aashifm1/xss-csrf-chain.git
cd xss-csrf-chain
chmod +x XSS_CSRF.sh
