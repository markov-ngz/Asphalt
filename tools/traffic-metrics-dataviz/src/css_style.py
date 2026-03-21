import streamlit as st 

st.markdown("""
<style>
    .stApp {
        background-color: #0f1117;
    }
    .block-container {
        max-width: 860px;
        padding-top: 2rem;
    }
    .stTabs [data-baseweb="tab"] {
        font-size: 1.05rem;
        font-weight: 600;
        padding: 0.5rem 1.4rem;
        color: #aab4c8;
    }
    .stTabs [aria-selected="true"] {
        color: #ffffff;
        border-bottom: 3px solid #4f8bf9;
    }
</style>
""", unsafe_allow_html=True)