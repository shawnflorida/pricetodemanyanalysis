import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import streamlit as st
from statsmodels.formula.api import ols

# Streamlit App Title
st.title("📊 Price Elasticity of Demand Analysis")

# Load Data
@st.cache_data
def load_data():
    df = pd.read_csv("data.csv")
    df = df.dropna(subset=["first", "second", "third"])
    
    if df.empty:
        return None
    
    # Calculate percentage changes and elasticities
    df["quantity_change_1_to_2_pct"] = ((df["sales_last_5_months_before_second_price_change"] - df["sales_last_5_months_before_first_price_change"]) / df["sales_last_5_months_before_first_price_change"]) * 100
    df["price_change_1_to_2_pct"] = ((df["second"] - df["first"]) / df["first"]) * 100
    df["elasticity_1_to_2"] = df["quantity_change_1_to_2_pct"] / df["price_change_1_to_2_pct"]

    df["quantity_change_2_to_3_pct"] = ((df["sales_first_5_months_after_third_price_change"] - df["sales_last_5_months_before_second_price_change"]) / df["sales_last_5_months_before_second_price_change"]) * 100
    df["price_change_2_to_3_pct"] = ((df["third"] - df["second"]) / df["second"]) * 100
    df["elasticity_2_to_3"] = df["quantity_change_2_to_3_pct"] / df["price_change_2_to_3_pct"]
    
    # Fill NaN values with 0 or any other value you prefer
    df = df.fillna(0)
    
    return df

df = load_data()

if df is None:
    st.warning("No data available. Please check your file.")
    st.stop()

# Sidebar Filters
st.sidebar.header("🔍 Filters")
selected_products = st.sidebar.multiselect("Select Products", df["product_code"].unique())

# Check if any products are selected
if not selected_products:
    st.warning("Choose a menu first")
    st.stop()

# Filter Data
df_filtered = df[df["product_code"].isin(selected_products)]

# Sidebar Graph Options
st.sidebar.header("📊 Graph Options")
show_scatter_first = st.sidebar.checkbox("Show Scatter Plot for First Price", True)
show_scatter_second = st.sidebar.checkbox("Show Scatter Plot for Second Price", True)
show_scatter_third = st.sidebar.checkbox("Show Scatter Plot for Third Price", True)
show_quantity_changes = st.sidebar.checkbox("Show Quantity Changes Bar Plot", True)
show_elasticities = st.sidebar.checkbox("Show Elasticities Bar Plot", True)
# Sidebar Location Filter
st.sidebar.header("🌍 Location Filter")
selected_locations = st.sidebar.multiselect("Select Locations", df["location"].unique())
# Add "All" option to locations
if "All" in selected_locations:
    selected_locations = df["location"].unique()
# Check if any locations are selected
if not selected_locations:
    st.warning("Choose a location first")
    st.stop()

# Filter Data by Location
df_filtered = df_filtered[df_filtered["location"].isin(selected_locations)]
# Scatter Plot for First Price
if show_scatter_first:
    st.subheader("📌 Scatter Plot for First Price")
    fig_static = plt.figure(figsize=(8, 6))
    for i, row in df_filtered.iterrows():
        plt.scatter(df_filtered["sales_last_5_months_before_first_price_change"], df_filtered["first"])
        plt.text(row["sales_last_5_months_before_first_price_change"], row["first"], row["product_code"], fontsize=9)
    plt.xlabel("Log of Original Bought Quantity", fontsize=12)
    plt.ylabel("Log of Original Price", fontsize=12)
    plt.title("Regular Price and Volume Observations", fontsize=14)
    st.pyplot(fig_static)

# Scatter Plot for Second Price
if show_scatter_second:
    st.subheader("📌 Scatter Plot for Second Price")
    fig_static_2 = plt.figure(figsize=(8, 6))
    for i, row in df_filtered.iterrows():
        plt.scatter(df_filtered["sales_last_5_months_before_second_price_change"], df_filtered["second"])
        plt.text(row["sales_last_5_months_before_second_price_change"], row["second"], row["product_code"], fontsize=9)
    plt.xlabel("Log of Quantity Before Second Price Change", fontsize=12)
    plt.ylabel("Second Price", fontsize=12)
    plt.title("Second Price and Volume Observations", fontsize=14)
    st.pyplot(fig_static_2)

# Scatter Plot for Third Price
if show_scatter_third:
    st.subheader("📌 Scatter Plot for Third Price")
    fig_static_3 = plt.figure(figsize=(8, 6))
    for i, row in df_filtered.iterrows():
        plt.scatter(df_filtered["sales_first_5_months_after_third_price_change"], df_filtered["third"])
        plt.text(row["sales_first_5_months_after_third_price_change"], row["third"], row["product_code"], fontsize=9)
    plt.xlabel("Log of Quantity After Third Price Change", fontsize=12)
    plt.ylabel("Third Price", fontsize=12)
    plt.title("Third Price and Volume Observations", fontsize=14)
    st.pyplot(fig_static_3)

# Quantity Changes Bar Plot
if show_quantity_changes:
    st.subheader("🔄 Quantity Changes Over Price Adjustments")
    if not df_filtered.empty:
        fig, axes = plt.subplots(2, 1, figsize=(12, 8))
        sns.barplot(x="product_code", y="quantity_change_1_to_2_pct", data=df_filtered, ax=axes[0])
        axes[0].set_title("Quantity Change from First to Second Price Change (%)")
        axes[0].set_xticklabels(axes[0].get_xticklabels(), rotation=90)

        sns.barplot(x="product_code", y="quantity_change_2_to_3_pct", data=df_filtered, ax=axes[1])
        axes[1].set_title("Quantity Change from Second to Third Price Change (%)")
        axes[1].set_xticklabels(axes[1].get_xticklabels(), rotation=90)
        plt.tight_layout()
        st.pyplot(fig)
    else:
        st.warning("No data available for quantity change plot.")

# Elasticity Bar Plot
if show_elasticities:
    st.subheader("⚖️ Price Elasticities Over Time")
    if not df_filtered.empty:
        fig, axes = plt.subplots(2, 1, figsize=(12, 8))
        sns.barplot(x="product_code", y="elasticity_1_to_2", data=df_filtered, ax=axes[0])
        axes[0].set_title("Elasticity from First to Second Price Change")
        axes[0].set_xticklabels(axes[0].get_xticklabels(), rotation=90)

        sns.barplot(x="product_code", y="elasticity_2_to_3", data=df_filtered, ax=axes[1])
        axes[1].set_title("Elasticity from Second to Third Price Change")
        axes[1].set_xticklabels(axes[1].get_xticklabels(), rotation=90)

        plt.tight_layout()
        st.pyplot(fig)
    else:
        st.warning("No data available for elasticity plot.")


# Display Data
st.subheader("📊 Data with Calculated Columns")
with st.expander("View Data Table"):
    st.dataframe(df_filtered[["product_code", "quantity_change_1_to_2_pct", "price_change_1_to_2_pct", "elasticity_1_to_2", 
                              "quantity_change_2_to_3_pct", "price_change_2_to_3_pct", "elasticity_2_to_3"]])