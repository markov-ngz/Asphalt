import streamlit as st
import plotly.graph_objects as go
import pandas as pd

from config import METRICS, MetricConfig , CONNECTION_CONFIG
from database import build_query
import utils
import css_style

PODIUM_COLORS = ["gold", "silver", "#cd7f32"]

st.set_page_config(
    page_title="Traffic Metrics",
    layout="centered",
)

conn = st.connection(**CONNECTION_CONFIG)

TAB_LABELS = {
    "Max Speed":       "🥇 Max Speed",
    "Active Vehicles": "🚌 Active Vehicles",
    "Avg Speed":       "📊 Avg Speed",
}


def fetch_metric(metric: MetricConfig) -> pd.DataFrame:
    return conn.query(build_query(metric), ttl="10m")


def podium_chart(df: pd.DataFrame, metric: MetricConfig) -> go.Figure:
    top3 = df.nlargest(3, metric.alias).copy()
    top3["label"] = top3.apply(lambda r: f"{r['city']} — {r['route_short_name']}", axis=1)
    top3["label"] = [f"{m}  {l}" for m, l in zip(["🥇", "🥈", "🥉"], top3["label"])]

    fig = go.Figure(go.Bar(
        y=top3["label"],
        x=top3[metric.alias],
        orientation="h",
        marker_color=PODIUM_COLORS,
        text=top3[metric.alias].round(2),
        textposition="auto",
    ))
    fig.update_layout(
        title=dict(text=metric.chart_title, font=dict(size=18)),
        xaxis_title=metric.x_axis_title,
        yaxis={"categoryorder": "total ascending"},
        height=380,
        margin=dict(l=20, r=20, t=50, b=40),
        paper_bgcolor="rgba(0,0,0,0)",
        plot_bgcolor="rgba(0,0,0,0)",
        font=dict(color="#e0e0e0"),
        xaxis=dict(gridcolor="#2a2d3a"),
    )
    return fig


def render_tab(metric: MetricConfig) -> None:
    
    df = fetch_metric(metric)
    
    if df.empty:
        st.error(f"No data available for **{metric.label}** — the query returned no results.")
        return

    # Display podium
    st.plotly_chart(podium_chart(df, metric), width='stretch')
    
    st.space(size="small")

    # Add timestamp information
    window_end = utils.format_window_end(df["window_end"].iloc[0])
    window_size = utils.format_window_size(df["window_start"].iloc[0], df["window_end"].iloc[0])

    
    col_info, col_btn = st.columns([6, 1])

    with col_info :
        st.caption(f"🕐 last update: **{window_end}** (window_size : {window_size}) ")
    with col_btn:
        if st.button("🔄", key=f"refresh_{metric.alias}", help="Refresh data"):
            conn.reset()
            st.rerun()
    
    st.space(size="small")
    # Detail 
    st.dataframe(df, width='stretch')


st.title("Traffic Metrics Dashboard")
st.space(size="small")

tabs = st.tabs([TAB_LABELS.get(m.label, m.label) for m in METRICS])
for tab, metric in zip(tabs, METRICS):
    with tab:
        st.space(size="small")
        render_tab(metric)