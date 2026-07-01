# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog+af2\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 0.967 A
- tm_score_ca_ordered: 0.665171893429773
- heavy_atom_rmsd: 3.096 A
- sidechain_heavy_atom_rmsd: 4.062 A
- **all-atom quality (honest):** heavy 3.096 A, sidechain 4.062 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.868

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E5-S6 → 28 conflicts (90%); I13 → 3 conflicts (10%)
- explained: 31/31 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.214), conflicts/hub=5.2, max_incompat=4.72Å, chain_span=0.393
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E5-S6 + I13 — explain ~31/31 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I13** — severity 6.68, 7 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.7,conf 0.58), A16@3.8Å(now 6.4,conf 0.58)
  - E5↔A16: targets 3.8/3.8Å but partners are 12.3Å apart → too_far_apart by 4.7Å
  - E5↔G4: targets 3.8/10.4Å but partners are 3.8Å apart → too_close_together by 2.7Å
  - E5↔P2: targets 3.8/13.5Å but partners are 7.5Å apart → too_close_together by 2.2Å
- **I10** — severity 5.90, 7 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): S6@3.8Å(now 7.3,conf 0.58)
  - S6↔P2: targets 3.8/16.2Å but partners are 9.1Å apart → too_close_together by 3.3Å
  - S6↔G4: targets 3.8/13.5Å but partners are 6.8Å apart → too_close_together by 2.8Å
  - S6↔I1: targets 3.8/18.6Å but partners are 12.5Å apart → too_close_together by 2.2Å
- **E5** — severity 5.26, 6 conflict(s); suspect input ~`A16` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 7.5,conf 0.58), I13@3.8Å(now 7.7,conf 0.58)
  - S14↔A16: targets 3.8/12.7Å but partners are 5.0Å apart → too_close_together by 3.9Å
  - S14↔I17: targets 3.8/11.8Å but partners are 5.2Å apart → too_close_together by 2.8Å
  - I13↔A16: targets 3.8/12.7Å but partners are 6.4Å apart → too_close_together by 2.5Å
- **S6** — severity 5.25, 6 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): I10@3.8Å(now 7.3,conf 0.58)
  - I10↔C26: targets 3.8/4.2Å but partners are 10.5Å apart → too_far_apart by 2.6Å
  - I10↔P2: targets 3.8/9.1Å but partners are 15.8Å apart → too_far_apart by 3.0Å
  - I10↔V25: targets 3.8/4.9Å but partners are 10.6Å apart → too_far_apart by 1.9Å
- **S14** — severity 3.91, 3 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.5,conf 0.58)
  - I17↔E5: targets 3.8/3.8Å but partners are 12.1Å apart → too_far_apart by 4.5Å
  - E5↔S6: targets 3.8/9.6Å but partners are 3.8Å apart → too_close_together by 2.0Å
  - E5↔G18: targets 3.8/6.8Å but partners are 12.2Å apart → too_far_apart by 1.6Å
- **A16** — severity 1.15, 2 conflict(s); suspect input ~`W9` (group: pull_in)
  - pull-in (wants closer): I13@3.8Å(now 6.4,conf 0.58)
  - I13↔W9: targets 3.8/17.2Å but partners are 11.7Å apart → too_close_together by 1.7Å
  - I13↔S6: targets 3.8/14.6Å but partners are 9.2Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=9 · 3-10(G)=6 · coil(C)=5

```
CEHHEEGGCEGCHHHHCGEECEHHEGGE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=0 · sheet=18
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)
  - C19 ↔ R28  (sheet)
  - S20 ↔ V25  (sheet)
  - S20 ↔ R28  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=46 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1954 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.043Å max=0.128Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 9, 11, 1, 7

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.022Å · max=0.09Å · AlphaFold-PAE analog (low block = rigid unit/domain)
