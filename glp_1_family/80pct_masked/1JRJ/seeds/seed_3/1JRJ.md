# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.518 A
- tm_score_ca_ordered: 0.3502236058896496
- heavy_atom_rmsd: 4.910 A
- sidechain_heavy_atom_rmsd: 5.858 A
- **all-atom quality (honest):** heavy 4.910 A, sidechain 5.858 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 126
- bin_accuracy: 0.778

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E23 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=5.0, max_incompat=3.83Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): E23 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E23** — severity 8.00, 5 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): K26@5.1Å(now 8.6,conf 0.64)
  - G1↔K26: targets 38.0/5.1Å but partners are 46.9Å apart → too_far_apart by 3.8Å
  - K26↔E16: targets 5.1/10.9Å but partners are 18.6Å apart → too_far_apart by 2.6Å
  - K26↔K11: targets 5.1/19.1Å but partners are 26.4Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=11 · 3-10(G)=5 · coil(C)=1

```
CEEEHHHEGHEHHEHHHHGHHHGHEHHGHEHHHEEGE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=6 · sheet=8
  - T6 ↔ S10  (helix)
  - M13 ↔ A17  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ G33  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ E14  (sheet)
  - L25 ↔ P30  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P37  (sheet)
  - P30 ↔ P35  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=120 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=27 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6729 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
