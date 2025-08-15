Streamlit Theming — Simple and Official

This project uses Streamlit's official theming via `.streamlit/config.toml`.

How to set theme:

1. Create or edit `.streamlit/config.toml` in the project root with:

   [theme]
   base = "dark"  # or "light"

2. (Optional) Add other theme keys per Streamlit docs: `primaryColor`, `backgroundColor`, `textColor`, etc.

3. Restart the Streamlit app (stop and run `streamlit run frontend.py`) to apply the theme.

Notes
- The app's sidebar provides a small UI to write `config.toml` for you: pick a base theme and click "Apply Theme".
- Committing `.streamlit/config.toml` to the repo will make the theme persistent across deployments.
- If your deployment environment is read-only, the sidebar's apply action may fail; instead create the file locally and deploy it.

References
- Official Streamlit theming docs: https://docs.streamlit.io/library/advanced-features/theming
