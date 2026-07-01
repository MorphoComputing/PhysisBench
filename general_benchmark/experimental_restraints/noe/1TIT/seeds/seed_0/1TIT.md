# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 10.605 A
- tm_score_ca_ordered: 0.16177277322157238
- heavy_atom_rmsd: 11.718 A
- sidechain_heavy_atom_rmsd: 12.874 A
- **all-atom quality (honest):** heavy 11.718 A, sidechain 12.874 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 77
- distogram_pairs: 118
- bin_accuracy: 0.483

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S71-Q73 → 11 conflicts (44%); F20-E21 → 5 conflicts (20%)
- explained: 16/25 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.138), conflicts/hub=2.1, max_incompat=7.27Å, chain_span=0.92
- **fix-first:** [LOW_CONFLICT] Root cause(s): S71-Q73 + F20-E21 — explain ~16/25 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 6.76, 7 conflict(s); suspect input ~`I56` (group: pull_in)
  - pull-in (wants closer): Q73@4.7Å(now 7.8,conf 0.38), I48@5.2Å(now 8.0,conf 0.26), I56@5.2Å(now 9.2,conf 0.26)
  - Q73↔I56: targets 4.7/5.2Å but partners are 16.1Å apart → too_far_apart by 6.3Å
  - Q73↔E21: targets 4.7/4.9Å but partners are 13.7Å apart → too_far_apart by 4.2Å
  - Q73↔F20: targets 4.7/5.0Å but partners are 13.3Å apart → too_far_apart by 3.6Å
- **L7** — severity 6.08, 6 conflict(s); suspect input ~`S71` (group: pull_in)
  - pull-in (wants closer): S79@4.7Å(now 9.1,conf 0.38), A80@4.7Å(now 8.4,conf 0.37), S71@4.9Å(now 8.1,conf 0.35)
  - E21↔S71: targets 4.8/4.9Å but partners are 13.3Å apart → too_far_apart by 3.6Å
  - A80↔E21: targets 4.7/4.8Å but partners are 12.8Å apart → too_far_apart by 3.3Å
  - F20↔S71: targets 4.7/4.9Å but partners are 12.7Å apart → too_far_apart by 3.1Å
- **I1** — severity 3.67, 2 conflict(s); suspect input ~`E26` (group: pull_in)
  - pull-in (wants closer): A75@4.4Å(now 8.7,conf 0.41), E26@4.9Å(now 8.3,conf 0.35)
  - A75↔E26: targets 4.4/4.9Å but partners are 16.5Å apart → too_far_apart by 7.3Å
  - E26↔N76: targets 4.9/5.1Å but partners are 14.1Å apart → too_far_apart by 4.1Å
- **C46** — severity 2.34, 2 conflict(s); suspect input ~`H60` (group: pull_in)
  - pull-in (wants closer): S43@4.2Å(now 8.3,conf 0.43)
  - S43↔H60: targets 4.2/4.4Å but partners are 11.9Å apart → too_far_apart by 3.4Å
  - S43↔L59: targets 4.2/4.5Å but partners are 11.1Å apart → too_far_apart by 2.5Å
- **A81** — severity 1.36, 1 conflict(s); suspect input ~`F20` (group: pull_in)
  - pull-in (wants closer): F20@4.7Å(now 8.4,conf 0.37)
  - S71↔F20: targets 4.3/4.7Å but partners are 12.7Å apart → too_far_apart by 3.7Å
- **V3** — severity 1.30, 1 conflict(s); suspect input ~`K78` (group: pull_in)
  - pull-in (wants closer): K78@4.7Å(now 8.2,conf 0.37)
  - L24↔K78: targets 3.9/4.7Å but partners are 12.1Å apart → too_far_apart by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=13 · 3-10(G)=13 · coil(C)=2

```
CEHHGCEEHHHHHHEGGHEHHHHHHHGHHHEHHGHHHHGHHGHHEHHHHGEHGGHHHHEEHHHHHHHGHHHHEHGEHHHHHHGHHHE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=31 · sheet=19
  - G9 ↔ F13  (helix)
  - V10 ↔ V14  (helix)
  - V14 ↔ A18  (helix)
  - A18 ↔ I22  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - L24 ↔ D28  (helix)
  - E26 ↔ H30  (helix)
  - D28 ↔ Q32  (helix)
  - Q32 ↔ K36  (helix)
  - W33 ↔ G37  (helix)
  - K36 ↔ L40  (helix)
  - G37 ↔ T41  (helix)
  - L40 ↔ P44  (helix)
  - S43 ↔ E47  (helix)
  - P44 ↔ I48  (helix)
  - I48 ↔ G52  (helix)
  - G52 ↔ I56  (helix)
  - L57 ↔ N61  (helix)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=943 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6206 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=77 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
