import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize, sent_tokenize
from nltk.tag import pos_tag

# Load common skills
with open('lib/utils/common_skills.txt', 'r') as f:
    common_skills = [line.strip() for line in f.readlines()]

def extract_skills(job_description):
    # Tokenize sentences
    sentences = sent_tokenize(job_description)
    
    # Tokenize words and remove stopwords
    stop_words = set(stopwords.words('english'))
    words = [word_tokenize(sentence) for sentence in sentences]
    words = [word for sublist in words for word in sublist if word.lower() not in stop_words]
    
    # Part-of-speech tagging
    tagged_words = pos_tag(words)
    
    # Extract skills (no longer limited to singular nouns)
    skills = [word for word, pos in tagged_words if word in common_skills]
    
    return skills[:3]  # Return top 3 skills (adjust as needed)

def main():
    while True:
        # Read job description from stdin
        input_line = input("Job description: ")
        if not input_line:
            break
        
        # Extract skills
        suggested_skills = extract_skills(input_line)
        
        # Output skills
        print(suggested_skills)

if __name__ == '__main__':
    main()