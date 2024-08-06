import pandas as pd

data_path = '/home/shwethalsayeeram_trikannad/cs131/a5/banana_quality.csv'

# Loading dataset
df = pd.read_csv(data_path)

m_path = '/home/shwethalsayeeram_trikannad/cs131/a5/metadata.txt'

with open(m_path, 'w') as f:
    
    num_rows, num_cols= df.shape
    f.write(f'Number of entries: {num_rows}\n')
    f.write(f'Number of features: {num_cols}\n')
    f.write('Features:\n')
    f.write(', '.join(df.columns) + '\n\n')

    f.write('Descriptive stats for numerical columns:\n')
    f.write(df.describe().to_string() + '\n\n')
    num_cols = df.select_dtypes(include=['number']).columns
    range_col = df[num_cols].max() - df[num_cols].min()
    f.write('Range for each numerical column:\n')
    f.write(range_col.to_string() + '\n\n')

    
    f.write('Unique values count for individual columns:\n')
    unique_counts = df.nunique()
    f.write(unique_counts.to_string() + '\n\n')
    
    for i in df.select_dtypes(include=['object']).columns:
        f.write(f'\nValue counts for column {i}:\n')
        f.write(df[i].value_counts().to_string() + '\n')
    
    f.write('\nMissing values per column:\n')
    miss_vals = df.isnull().sum()
    f.write(miss_vals.to_string() + '\n')



