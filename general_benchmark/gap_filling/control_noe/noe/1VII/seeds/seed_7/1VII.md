# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1VII\seeds\seed_7\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 6.357 A
- tm_score_ca_ordered: 0.09515510057107075
- heavy_atom_rmsd: 7.647 A
- sidechain_heavy_atom_rmsd: 8.596 A
- **all-atom quality (honest):** heavy 7.647 A, sidechain 8.596 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 51
- bin_accuracy: 0.490

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K29 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=2.5, max_incompat=5.23Å, chain_span=0.206
- **fix-first:** [LOW_CONFLICT] Root cause(s): K29 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F10** — severity 2.42, 3 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 7.9,conf 0.35), L1@5.2Å(now 8.6,conf 0.26)
  - K29↔L1: targets 4.9/5.2Å but partners are 15.3Å apart → too_far_apart by 5.2Å
  - L1↔L28: targets 5.2/5.5Å but partners are 13.6Å apart → too_far_apart by 2.8Å
  - K29↔R14: targets 4.9/5.2Å but partners are 11.7Å apart → too_far_apart by 1.6Å
- **F17** — severity 1.03, 2 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@5.2Å(now 8.9,conf 0.26)
  - R14↔K29: targets 4.0/5.2Å but partners are 11.7Å apart → too_far_apart by 2.5Å
  - F6↔K29: targets 4.9/5.2Å but partners are 11.6Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=6 · 3-10(G)=3 · coil(C)=1

```
CEHGHEHGHHHHHHHHEHEHGHHHHHHHHHHEHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=17 · sheet=8
  - D3 ↔ K7  (helix)
  - D5 ↔ V9  (helix)
  - K7 ↔ G11  (helix)
  - V9 ↔ T13  (helix)
  - F10 ↔ R14  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - A16 ↔ L20  (helix)
  - A18 ↔ L22  (helix)
  - L20 ↔ K24  (helix)
  - L22 ↔ Q26  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - N27 ↔ E31  (helix)
  - K29 ↔ G33  (helix)
  - S2 ↔ F17  (sheet)
  - S2 ↔ N19  (sheet)
  - F6 ↔ F17  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=284 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=172 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0885 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
