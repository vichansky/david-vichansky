import streamlit as st
from pyvis.network import Network
import networkx as nx

# Create a random geometric graph
G = nx.random_geometric_graph(n=50, radius=0.125, seed=140)

# Create a PyVis Network
net = Network(notebook=False, width="100%", height="600px")

# Recalculate layout only once and store positions in session state
if 'positions' not in st.session_state:
    # Calculate node positions once using spring layout (or any layout you prefer)
    positions = nx.spring_layout(G, seed=42)  # Fixed layout for reproducibility
    st.session_state.positions = positions  # Store positions in session state

# Add nodes and edges from the graph to the PyVis network
for node in G.nodes():
    # Set the node positions using precomputed positions
    net.add_node(node, label=str(node), x=st.session_state.positions[node][0], y=st.session_state.positions[node][1])

for edge in G.edges():
    net.add_edge(edge[0], edge[1])

# Dropdown menu to select a node
selected_node = st.selectbox('Select a node to highlight', list(G.nodes()))

# Display neighbors of the selected node above the graph
if selected_node is not None:
    neighbors = list(G.neighbors(selected_node))
    st.write(f"Neighbors of node {selected_node}: {neighbors}")

# Highlight selected node and its neighbors
highlighted_nodes = [selected_node] + list(G.neighbors(selected_node))

# Update node colors based on selection, without changing graph structure
for node in G.nodes():
    if node in highlighted_nodes:
        net.get_node(node)['color'] = 'red'  # Highlight selected node and its neighbors
    else:
        net.get_node(node)['color'] = 'blue'  # Other nodes are in blue

# Generate the HTML for the graph
html_content = net.generate_html()

# Display the graph in Streamlit
st.components.v1.html(html_content, height=600)