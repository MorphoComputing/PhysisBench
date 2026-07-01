# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.088 A
- tm_score_ca_ordered: 0.3751736502529619
- heavy_atom_rmsd: 5.265 A
- sidechain_heavy_atom_rmsd: 6.868 A
- **all-atom quality (honest):** heavy 5.265 A, sidechain 6.868 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 248
- bin_accuracy: 0.754

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I22 → 3 conflicts (60%)
- explained: 3/5 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=2.5, max_incompat=2.46Å, chain_span=0.243
- **fix-first:** [LOW_CONFLICT] Root cause(s): I22 — explain ~3/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I22** — severity 6.26, 3 conflict(s); suspect input ~`A17` (group: pull_in)
  - pull-in (wants closer): K26@7.0Å(now 9.7,conf 0.99)
  - A17↔K26: targets 7.0/7.0Å but partners are 16.5Å apart → too_far_apart by 2.5Å
  - E16↔K26: targets 9.0/7.0Å but partners are 18.2Å apart → too_far_apart by 2.2Å
  - K26↔S7: targets 7.0/23.4Å but partners are 32.4Å apart → too_far_apart by 2.0Å
- **M13** — severity 2.20, 2 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): A34@21.9Å(now 24.4,conf 0.68)
  - T6↔A34: targets 11.1/21.9Å but partners are 34.6Å apart → too_far_apart by 1.6Å
  - D8↔A34: targets 8.8/21.9Å but partners are 32.3Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=13 · 3-10(G)=4 · coil(C)=2

```
CEGECEHEHHHEHEHHEHHGHEHHEHEHHHHGHEEGE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=7 · sheet=17
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - K11 ↔ E15  (helix)
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - W24 ↔ G28  (helix)
  - G29 ↔ G33  (helix)
  - T6 ↔ Q12  (sheet)
  - T6 ↔ E14  (sheet)
  - D8 ↔ E14  (sheet)
  - Q12 ↔ A17  (sheet)
  - E14 ↔ I22  (sheet)
  - A17 ↔ I22  (sheet)
  - A17 ↔ P37  (sheet)
  - I22 ↔ N27  (sheet)
  - I22 ↔ A34  (sheet)
  - I22 ↔ P35  (sheet)
  - I22 ↔ P37  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P35  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=18 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0446 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
