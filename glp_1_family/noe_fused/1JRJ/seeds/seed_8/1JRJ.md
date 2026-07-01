# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.259 A
- tm_score_ca_ordered: 0.3311620786361987
- heavy_atom_rmsd: 4.869 A
- sidechain_heavy_atom_rmsd: 6.175 A
- **all-atom quality (honest):** heavy 4.869 A, sidechain 6.175 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 155
- bin_accuracy: 0.768

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=1.0, max_incompat=3.31Å, chain_span=0.162
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P30** — severity 2.04, 1 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): W24@5.4Å(now 8.2,conf 0.70)
  - E23↔W24: targets 12.0/5.4Å but partners are 3.3Å apart → too_close_together by 3.3Å
- **P36** — severity 1.07, 1 conflict(s); suspect input ~`K26` (group: push_out)
  - push-out (wants farther): K26@11.4Å(now 6.2,conf 0.62)
  - K26↔W24: targets 11.4/5.8Å but partners are 3.9Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=5 · 3-10(G)=6 · coil(C)=1

```
EEGGCHHHHHHHHHHHHHHHHHHHHHHGGEHHHEGGE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=15 · sheet=1
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - N27 ↔ S31  (helix)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=128 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=27 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7636 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
